module Stories.Ryan.Basics.Typography exposing (main)

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
    Ryan.Ui.col [ Ryan.Ui.width.px420, Ryan.Ui.gap.px25, Ryan.Ui.align.left ]
        [ Ryan.Ui.h1 [] "Heading 1"
        , Ryan.Ui.h2 [] "Heading 2"
        , Ryan.Ui.h3 [] "Heading 3"
        , Ryan.Ui.h4 [] "Heading 4"
        , Ryan.Ui.h5 [] "Heading 5"
        , Ryan.Ui.h6 [] "Heading 6"
        , Ryan.Ui.p [] "Paragraph"
        , Ryan.Ui.p [] """
                  Another paragraph that includes a longer sentence. 
                  Now you can see how the line height ensures our text
                  remains spaced out as it wraps to the next line.
                  """
        ]
