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
    , ("marginLeft", "130px")
    ]
    
    
companyNameStyle : List(String, String)
companyNameStyle = 
    [ ("width", "100px")
    , ("marginLeft", "10px")
    , ("textAlign", "left")
    ]
    
lineNameStyle : List(String, String)
lineNameStyle = 
    [ ("width", "200px")
    , ("textAlign", "left")
    ]
    
    
buttonStyle : List(String, String)
buttonStyle = 
    [ ("marginLeft", "350px")
    , ("marginTop", "20px")
    ]
