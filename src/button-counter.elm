import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main = Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model = { clicks : Int }

init : Model
init = { clicks = 0 }

-- UPDATE

type Msg = Increase | Decrease | Reset

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increase -> { model | clicks = (model.clicks + 1) }
    Decrease -> { model | clicks = (model.clicks - 1) }
    Reset -> { model | clicks = 0 }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div [] [ text "Hello world" ]
    , div [] [ text ("Clicks: " ++ String.fromInt model.clicks) ]
    , button [ onClick Decrease ] [ text "-" ]
    , button [ onClick Increase ] [ text "+" ]
    , button [ onClick Reset ] [ text "Reset" ]
    ]
