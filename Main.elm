module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Date exposing (..)
import Date.Extra.Config.Config_ja_jp exposing (config)
import Date.Extra.Format as Format exposing (format)
import Json.Encode
import Json.Decode
import Json.Decode.Pipeline
import Http exposing (..)
import RailwayColour exposing (..)
import Style exposing (..)

getStatusCmd : Cmd Msg
getStatusCmd = Http.send StatusesResult <| Http.get "https://rti-giken.jp/fhc/api/train_tetsudo/delay.json" decodeStatuses

decodeStatus : Json.Decode.Decoder RailwayStatus
decodeStatus =
    Json.Decode.Pipeline.decode RailwayStatus
        |> Json.Decode.Pipeline.required "name" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "company" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "lastupdate_gmt" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "source" (Json.Decode.string)


decodeStatuses : Json.Decode.Decoder (List RailwayStatus)
decodeStatuses =
    Json.Decode.list decodeStatus


encodeStatus : RailwayStatus -> Json.Encode.Value
encodeStatus record =
    Json.Encode.object
        [ ( "name", Json.Encode.string <| record.name )
        , ( "company", Json.Encode.string <| record.company )
        , ( "lastupdateGmt", Json.Encode.int <| record.lastupdateGmt )
        , ( "source", Json.Encode.string <| record.source )
        ]

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }

-- types

type alias RailwayStatus =
    { name : String
    , company : String
    , lastupdateGmt : Int
    , source : String
}

type alias Model =
    { statuses : List RailwayStatus
    , message : String
}

type Msg
    = GetStatuses
    | StatusesResult (Result Http.Error (List RailwayStatus))
    
-- model

init : ( Model, Cmd Msg )
init =
    ( { message = "", statuses = [] }, getStatusCmd )

-- update

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetStatuses ->
            ( model, getStatusCmd )

        StatusesResult (Ok statuses) ->
            ( { model | statuses = statuses, message = "" }, Cmd.none )

        StatusesResult (Err err) ->
            ( { model | message = (toString err), statuses = [] }, Cmd.none )
            
-- view

view : Model -> Html Msg
view model =
    div []
        [ text model.message
        , list model.statuses
        , button [ onClick GetStatuses ] [ text "情報取得" ]
        ]
        
list : List RailwayStatus -> Html Msg
list statuses =
    div [ class "p2" ]
        [ table []
            [ tbody [] (List.map statusRow statuses)
            ]
        ]
        
statusRow : RailwayStatus -> Html Msg
statusRow status =
    tr []
        [ td [] [ div [ Html.Attributes.style (Style.circleStyle (RailwayColour.railwayColour status.name)) ] [] ]
        , td [] [ div [ Html.Attributes.style (Style.companyNameStyle) ] [ text status.company ] ]
        , td [] [ div [ Html.Attributes.style (Style.lineNameStyle) ] [ text status.name ] ]
        , td [] [ text (String.slice 1 -1 (toString ((format config config.format.dateTime) (Date.fromTime (toFloat status.lastupdateGmt * 1000))))) ]
        , td []
            []
        ]

-- subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
