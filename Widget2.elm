module Widget2 exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- MODEL
type alias Model = { count : Int }

initialModel : Model
initialModel = { count = 100 }

-- MESSAGES
type Msg = Decrease

-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (toString model.count) ]
        , button [ onClick Decrease ] [ Html.text "Click-" ]
        ]

-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Decrease ->
            ( { model | count = model.count - 2 }, Cmd.none )

