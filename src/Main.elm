module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { draft : String
    , messages : List String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { draft = "", messages = [] }
    , Cmd.none
    )


type Msg
    = DraftChanged String
    | Send


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DraftChanged draft ->
            ( { model | draft = draft }
            , Cmd.none
            )

        Send ->
            ( { model | draft = "", messages = model.messages ++ [ model.draft ] }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Echo Chat" ]
        , input
            [ type_ "text"
            , placeholder "Draft"
            , onInput DraftChanged
            , value model.draft
            ]
            []
        , button [ onClick Send ] [ text "Send" ]
        , ul []
            (List.map (\msg -> li [] [ text msg ]) model.messages)
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
