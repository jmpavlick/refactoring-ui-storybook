module Stories.Design.Color exposing (..)

import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Html exposing (Html)
import Storybook.Story exposing (Story)
import Ui.Design.Color as Color


main : Story () Never
main =
    Storybook.Story.stateless
        { view = view
        }


view : Html Never
view =
    List.map blockRow rainbow
        |> Element.column [ Element.spacing 10 ]
        |> Element.layout []
        |> Html.map never


block : Element.Color -> Element Never
block color =
    Element.row []
        [ Element.el
            [ Element.width <| Element.px 64
            , Element.height <| Element.px 64
            , Border.rounded 10
            , Background.color color
            ]
          <|
            Element.none
        ]


blockRow : Color.Swatch -> Element Never
blockRow swatch =
    List.map
        (\selector ->
            selector swatch
                |> block
        )
        [ .a, .b, .c, .d, .e, .f, .g, .h ]
        |> Element.row [ Element.spacing 10 ]


rainbow : List Color.Swatch
rainbow =
    List.map
        (\hue -> Color.swatch { hue = hue })
        [ 0, 40, 55, 125, 220, 255, 286 ]
