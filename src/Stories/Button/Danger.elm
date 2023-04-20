module Stories.Button.Danger exposing (main)

import Html exposing (Html)
import Ryan.Ui.Button
import Storybook.Story exposing (Story)


main : Story () Msg
main =
    Storybook.Story.stateless
        { view = view
        }


type Msg
    = UserClickedDeleteAccount


view : Html Msg
view =
    Ryan.Ui.Button.new { label = "Delete account" }
        |> Ryan.Ui.Button.withDangerStyle
        |> Ryan.Ui.Button.onClick UserClickedDeleteAccount
        |> Ryan.Ui.Button.view
