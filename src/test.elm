import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

main = Browser.sandbox { init = init, update = update, view = view }

-- Model
type alias Model = Int

init : Model
init = 42

-- Update

type Event = Update

update : Event -> Model -> Model
update msg model =
  case msg of
    Update -> model + 1

-- View
view : Model -> Html Event
view model =
  div []
    [ text "Hi ho "
    , text (String.fromInt model)
    , div [ onClick Update ]
      [ text "Click me" ]
    ]
