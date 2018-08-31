import Browser
import Html exposing (Html, Attribute, button, div, text, input )
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

main = Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model = { text : String }

init : Model
init = { text = "This text will get reversed" }

-- UPDATE

type Msg = Reverse | Update String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Reverse -> { model | text = String.reverse model.text }
    Update newText -> { model | text = newText }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ value model.text, onInput Update ] []
    , div [] [ text model.text ]
    , button [ onClick Reverse ] [ text "Reverse" ]
    ]
