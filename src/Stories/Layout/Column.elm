module Stories.Layout.Column exposing (main)

import Html exposing (Html)
import Ryan.Ui
import Storybook.Story exposing (Story)


main : Story () msg
main =
    Storybook.Story.stateless
        { view = view
        }


view : Html msg
view =
    Ryan.Ui.col [ Ryan.Ui.pad.px25, Ryan.Ui.gap.px25, Ryan.Ui.bg.blue800 ]
        [ square [ Ryan.Ui.bg.red400 ]
        , square [ Ryan.Ui.bg.blue400 ]
        , square [ Ryan.Ui.bg.green400 ]
        ]


square : List (Html.Attribute msg) -> Html msg
square attrs =
    Ryan.Ui.row (Ryan.Ui.width.px50 :: Ryan.Ui.height.px50 :: attrs) []
