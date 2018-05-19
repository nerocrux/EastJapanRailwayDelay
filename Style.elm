module Style exposing (..)

circleStyle : String -> List(String, String)
circleStyle colour =
    [ ("display", "inline-block")
    , ("backgroundColor", "#" ++ colour)
    , ("width", "20px")
    , ("height", "20px")
    , ("textAlign", "center")
    , ("lineHeight", "20px")
    , ("verticalAlign", "middle")
    , ("borderRadius", "50%")
    , ("border", "solid 3px " ++ colour)
    ]
