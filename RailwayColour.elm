module RailwayColour exposing (..)

import CsvDecode exposing (..)

type alias RailwayColour = 
    { name : String
    , colour : String
}

colourDecoder : Decoder RailwayColour
colourDecoder =
    succeed RailwayColour
        |= field "name"
        |= field "colour"
        
railwayColour : String -> String
railwayColour name =
    let 
        (colours, error) = CsvDecode.runAll colourDecoder source
        found = List.head (List.filter (\c -> c.name == name) colours)
    in
        case found of
            Nothing -> 
                "AAAAAA"
            Just found ->
                found.colour

source : String
source =
    """
name,colour
山手線,99CC00
湘南新宿ライン,E21F26
東海道線,F68B1E
横須賀線,007AC0
横浜線,9ACD32
相模線,2BA19C
南武線,FFD600
中央線快速電車,F15A22
中央･総武各駅停車,FFD400
総武快速線,007AC0
中央本線,3B6C9C
総武本線,FFC500
青梅線,F15A22
五日市線,F15A22
宇都宮線,F68B1E
高崎線,F68B1E
八高線,A8A39D
日光線,008000
常磐線,00B261
常磐線快速電車,00B261
常磐線各駅停車,00B261
内房線,00B2E5
外房線,DC4534
成田線,4CBA6C
京葉線,FF4500
武蔵野線,FF4500
東金線,F15F2B
久留里線,00B5AD
吾妻線,0F5474
水郡線,008000
水戸線,3333ff
両毛線,FFFF00
京浜東北線,00BAE8
西武線,F17900
東武線,0F6CC3
銀座線,F7931D
丸ノ内線,E60012
日比谷線,89A1AD
東西線,00A7DB
千代田線,009933
有楽町線,C5C544
半蔵門線,A757A8
南北線,00ADA9
副都心線,BB6633
京成線,3366FF
京王電鉄線,EA1C7C
浅草線,E85298
三田線,0079C2
新宿線,6CBB5A
大江戸線,B6007A
小田急線,00a9ff
東京モノレール,008000
りんかい線,0000FF
京急線,00CCFF
日暮里･舎人ライナー,FF69B4
相鉄線,CC0066
東急線,DA0442
横浜市営地下鉄,006BF0
ゆりかもめ,27404E
埼京線,008000
川越線,00B48D
千葉モノレール,2843BA
多摩モノレール,FF6633
山陽電鉄線,0088CC
つくばエクスプレス線,DIC255
新京成線,3366FF
伊東線,F68B1E
高徳線,99CC00
烏山線,008000
鶴見線,FFFF00
鹿島線,CC6633    
"""
