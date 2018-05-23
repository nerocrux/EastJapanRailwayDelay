module RailwayCompany exposing (..)

eastJapanRailwayCompanyList : List String
eastJapanRailwayCompanyList = [
    "JR東日本",
    "西武鉄道",
    "東武鉄道",
    "東京メトロ",
    "京成電鉄",
    "京王電鉄",
    "都営地下鉄",
    "小田急電鉄",
    "東京モノレール",
    "りんかい線",
    "京浜急行電鉄",
    "日暮里･舎人ライナー",
    "相模鉄道",
    "東京急行電鉄",
    "横浜市交通局",
    "ゆりかもめ",
    "千葉モノレール",
    "多摩モノレール",
    "山陽電気鉄道",
    "つくばエクスプレス",
    "新京成電鉄",
    "JR関東"]

isEasyJapanCompany : String -> Bool
isEasyJapanCompany company =
    List.member company eastJapanRailwayCompanyList
