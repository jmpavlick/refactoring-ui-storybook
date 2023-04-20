module Stories.Ryan.Form.Input exposing (main)

import Html exposing (Html)
import Ryan.Ui.Button
import Ryan.Ui.Input
import Storybook.Story exposing (Story)


main : Story Model Msg
main =
    Storybook.Story.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    { value : String
    }


init : Model
init =
    { value = ""
    }



-- UPDATE


type Msg
    = UserChangedInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UserChangedInput newValue ->
            { model | value = newValue }



-- VIEW


view : Model -> Html Msg
view model =
    Ryan.Ui.Input.new
        { label = "Name"
        , value = model.value
        , onChange = UserChangedInput
        }
        |> Ryan.Ui.Input.withLabelAbove
        |> Ryan.Ui.Input.view
