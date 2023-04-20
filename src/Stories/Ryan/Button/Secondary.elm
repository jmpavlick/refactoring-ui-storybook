module Stories.Ryan.Button.Secondary exposing (main)

import Html exposing (Html)
import Ryan.Ui.Button
import Storybook.Story exposing (Story)


main : Story () Msg
main =
    Storybook.Story.stateless
        { view = view
        }


type Msg
    = UserClickedCancel


view : Html Msg
view =
    Ryan.Ui.Button.new { label = "Cancel" }
        |> Ryan.Ui.Button.withSecondaryStyle
        |> Ryan.Ui.Button.onClick UserClickedCancel
        |> Ryan.Ui.Button.view
