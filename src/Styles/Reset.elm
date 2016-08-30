module Styles.Reset exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)


css : Css.Stylesheet
css =
    (Css.stylesheet << namespace "")
        [ selector "*" [ boxSizing borderBox ]
        , html bodyHtmlMixin
        , body bodyHtmlMixin
        , h1 headerMixin
        , h2 headerMixin
        , h3 headerMixin
        , h4 headerMixin
        , h5 headerMixin
        , h6 headerMixin
        , ul listMixin
        , li listMixin
        ]


-- mixins


bodyHtmlMixin : List Mixin
bodyHtmlMixin =
    [ fontWeight (int 400)
    , fontSize (px 14)
    , lineHeight (px 21)
    , property "font-family" "'Helvetica Neue', Helvetica, sans-serif"
    , property "--webkit-font-smoothing" "antialiased"
    , height (pct 100)
    , margin zero
    , padding zero
    , width (pct 100)
    ]


headerMixin : List Mixin
headerMixin =
    [ margin zero
    , padding zero
    ]


listMixin : List Mixin
listMixin =
    [ property "list-style" "none"
    , margin zero
    , padding zero
    ]

