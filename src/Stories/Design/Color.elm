module Stories.Design.Color exposing (..)

import Element exposing (Element)
import Html exposing (Html)
import Storybook.Story exposing (Story)


main : Story () Never
main =
    Storybook.Story.stateless
        { view = view
        }


view : Html Never
view =
    Element.text "todo" |> Element.layout [] |> Html.map never
