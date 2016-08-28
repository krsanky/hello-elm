module Main exposing (..)

import Html exposing (Html)
import Html.App

import Widget
import Widget2
import Board

-- MODEL
type alias AppModel = { widgetModel : Widget.Model 
                      , widgetModel2 : Widget2.Model 
                      , boardModel : Board.Model }

initialModel : AppModel
initialModel = { widgetModel = Widget.initialModel 
               , widgetModel2 = Widget2.initialModel 
               , boardModel = Board.initialModel }

init : ( AppModel, Cmd Msg )
init = ( initialModel, Cmd.none )

-- MESSAGES
type Msg = WidgetMsg Widget.Msg | WidgetMsg2 Widget2.Msg | BoardMsg Board.Msg

-- VIEW
view : AppModel -> Html Msg
view model =
    Html.div []
        [ Html.App.map WidgetMsg (Widget.view model.widgetModel)
        , Html.App.map WidgetMsg2 (Widget2.view model.widgetModel2)
        , Html.App.map BoardMsg (Board.view model.boardModel)
        ]

-- UPDATE
update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update message model =
    case message of
        WidgetMsg subMsg ->
            let
                ( updatedWidgetModel, widgetCmd ) =
                    Widget.update subMsg model.widgetModel
            in
                ( { model | widgetModel = updatedWidgetModel }, Cmd.map WidgetMsg widgetCmd )

        WidgetMsg2 subMsg2 ->
            let
                ( updatedWidgetModel, widgetCmd ) =
                    Widget2.update subMsg2 model.widgetModel2
            in
                ( { model | widgetModel2 = updatedWidgetModel }, Cmd.map WidgetMsg2 widgetCmd )

        BoardMsg bMsg ->
            -- (model, Cmd.none)
            let
                ( updatedBoardModel, bCmd ) =
                    Board.update bMsg model.boardModel
            in
                ( { model | boardModel = updatedBoardModel }, Cmd.map BoardMsg bCmd )


-- SUBSCIPTIONS
subscriptions : AppModel -> Sub Msg
subscriptions model = Sub.none

-- APP
main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
