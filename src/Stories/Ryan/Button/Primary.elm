module Stories.Ryan.Button.Primary exposing (main)

import Html exposing (Html)
import Ryan.Ui.Button
import Storybook.Story exposing (Story)


main : Story () Msg
main =
    Storybook.Story.stateless
        { view = view
        }


type Msg
    = UserClickedSignUp


view : Html Msg
view =
    Ryan.Ui.Button.new { label = "Sign up" }
        |> Ryan.Ui.Button.onClick UserClickedSignUp
        |> Ryan.Ui.Button.view
