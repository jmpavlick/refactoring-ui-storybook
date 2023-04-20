module Stories.Design.Color exposing (..)

import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Html exposing (Html)
import Storybook.Story exposing (Story)


main : Story () Never
main =
    Storybook.Story.stateless
        { view = view
        }


view : Html Never
view =
    List.map block rrainbow
        |> Element.column [ Element.spacing 10 ]
        |> Element.layout []
        |> Html.map never


block : Element.Color -> Element Never
block color =
    Element.el
        [ Element.width <| Element.px 210
        , Element.height <| Element.px 64
        , Border.rounded 10
        , Background.color color
        ]
    <|
        Element.none


black : Element.Color
black =
    hsl
        { h = 63
        , s = 1
        , l = 0.5
        }


rainbow : List Element.Color
rainbow =
    List.range 0 9
        |> List.map (\value -> value * 36)
        |> List.map
            (\value ->
                hsl { h = value, s = 1, l = 0.5 }
            )


rrainbow : List Element.Color
rrainbow =
    let
        sl =
            \h -> { h = h, s = 1, l = 0.5 } |> hsl
    in
    List.map
        sl
        [ 0, 40, 55, 125, 220, 320, 340 ]


hslToRgb : { h : Int, s : Float, l : Float } -> { r : Int, g : Int, b : Int }
hslToRgb { h, s, l } =
    let
        hFloat : Float
        hFloat =
            Basics.toFloat h / 360

        hueToRgb : { p_ : Float, q_ : Float, t : Float } -> Float
        hueToRgb { p_, q_, t } =
            let
                minT : Float
                minT =
                    Basics.min t 1

                t_ : Float
                t_ =
                    if minT > 1 then
                        minT - 1

                    else
                        minT
            in
            if t_ < 1 / 6 then
                p_ + (q_ - p_) * 6 * t_

            else if t_ < 1 / 2 then
                q_

            else if t_ < 2 / 3 then
                p_ + (q_ - p_) * (2 / 3 - t_) * 6

            else
                p_

        q : Float
        q =
            if l < 0.5 then
                l * (1 + s)

            else
                l + s - l * s

        p : Float
        p =
            2 * l - q

        toHex : Float -> Int
        toHex =
            (*) 255 >> Basics.round

        pq : Float -> Int
        pq bOffset =
            toHex <| hueToRgb { p_ = p, q_ = q, t = hFloat + bOffset }
    in
    if s == 0 then
        toHex l
            |> (\lHex ->
                    { r = lHex
                    , g = lHex
                    , b = lHex
                    }
               )

    else
        { r = pq (1 / 3)
        , g = pq 0
        , b = pq (Basics.negate 1 / 3)
        }


hsl : { h : Int, s : Float, l : Float } -> Element.Color
hsl params =
    let
        { r, g, b } =
            hslToRgb params |> Debug.log "r g b:"
    in
    Element.fromRgb255
        { red = r
        , green = g
        , blue = b
        , alpha = 1
        }
