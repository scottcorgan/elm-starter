module Styles.Reset exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)


css : Css.Stylesheet
css =
    (Css.stylesheet << namespace "")
        [ everything [ boxSizing borderBox ]
        , each [ html, body ]
            [ fontWeight (int 400)
            , fontSize (px 14)
            , lineHeight (px 21)
            , fontFamilies [ "'Helvetica Neue'", "Helvetica", "sans-serif" ]
            , property "--webkit-font-smoothing" "antialiased"
            , height (pct 100)
            , margin zero
            , padding zero
            , width (pct 100)
            ]
        , each [ h1, h2, h3, h4, h5, h6 ]
            [ margin zero
            , padding zero
            ]
        , p [ padding (px 20), margin zero ]
        ]
