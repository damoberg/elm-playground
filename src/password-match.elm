import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

main = Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }

init : Model
init = Model "" "" ""

-- UPDATE

type Msg = Submit String | Pwd1 String | Pwd2 String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Submit new -> { model | name = new }
    Pwd1 new -> { model | password = new }
    Pwd2 new -> { model | passwordAgain = new }

-- VIEW

inputComponent : String -> String -> String -> (String -> msg) -> Html msg
inputComponent t v i handleInput = input [ type_ t, value v, id i, onInput handleInput ] []

checkPassword : Model -> Html msg
checkPassword model =
  if model.password == model.passwordAgain then
    div [style "color" "green" ] [ text "Good job with the passwords" ]
  else
    div [style "color" "red" ] [ text "What are you doing?" ]

view : Model -> Html Msg
view model =
  div []
    [ Html.form []
      [ label [ for "name" ] [ text "Name:" ]
      , inputComponent "text" model.name "name" Submit
      , div [ style "padding" "10px", style "border" "dashed 1px orange", style "margin" "10px" ]
        [ inputComponent "password" model.password "pwd1" Pwd1
        , inputComponent "password" model.passwordAgain "pwd1" Pwd2
        , if String.length model.password > 0 then checkPassword model else text ""
        ]
      ]
  ]
