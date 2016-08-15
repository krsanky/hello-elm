module Board exposing (..)

import Html exposing (Html, button, div, text)
-- import Html.Events exposing (onClick)
import Html.App exposing (beginnerProgram)
import List exposing (map)
import Svg exposing (svg)
import Svg.Events exposing (onClick)
import Svg.Attributes exposing (width, height, r, cx, cy, fill)

-- MODEL
type alias Model = String
initialModel : Model
initialModel = "String..." 

-- MESSAGES
type Msg = Change1

-- VIEW
svgCircle (xCenter, yCenter) =
    Svg.circle [ r "15"
               , fill "red"
               , cy (toString xCenter)
               , cx (toString yCenter)
               , onClick (Just (xCenter, yCenter) )
               ] []

-- view : Model -> Html Msg
view model =
    div []
        [ text "model" 

--         [ 
           ,   Html.text (toString model)
 
--          , div []
--                [ svg [ width "100" , height "100" ]
--                      (map svgCircle [ (30, 30) , (70, 30) , (50, 60) ])
--                ]
-- 
--          div [] [ text (toString model.count) ]
         , button [ onClick Change1 ] [ Html.text "bord" ]
         ]



-- view model =
--     div []
--         [ div [] [ text (toString model.count) ]
--         , button [ onClick Increase ] [ Html.text "Click" ]
--         ]



-- -- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Change1 ->
            ( model ++ "." , Cmd.none )

--         Increase ->
--             ( { model | count = model.count + 1 }, Cmd.none )

