module Ui.Design.Color exposing (Swatch, swatch)

import Element
import Element.Hsl as Hsl


type alias Swatch =
    { a : Element.Color
    , b : Element.Color
    , c : Element.Color
    , d : Element.Color
    , e : Element.Color
    , f : Element.Color
    , g : Element.Color
    , h : Element.Color
    }


swatch : { hue : Int } -> Swatch
swatch { hue } =
    { a = Hsl.hsl hue 1 0.14
    , b = Hsl.hsl hue 1 0.28
    , c = Hsl.hsl hue 1 0.35
    , d = Hsl.hsl hue 1 0.42
    , e = Hsl.hsl hue 1 0.49
    , f = Hsl.hsl hue 1 0.56
    , g = Hsl.hsl hue 1 0.63
    , h = Hsl.hsl hue 1 0.7
    }
