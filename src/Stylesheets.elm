port module Stylesheets exposing (..)

import String

import Css exposing (..)
import Css.File exposing (..)
import Html exposing (div)
import Html.App as Html

import Styles.Reset as ResetStyles


port files : CssFileStructure -> Cmd msg


styles : List Css.Stylesheet
styles =
    [ ResetStyles.css
    ]


cssFiles : CssFileStructure
cssFiles =
    toFileStructure [ ("dist/styles.css", compileMany styles) ]


compileMany : List Css.Stylesheet -> { warnings: List String, css: String }
compileMany styles =
    let
        results =
            List.map Css.compile styles
    in
        { warnings = List.concatMap .warnings results
        , css = String.join "\n\n" (List.map .css results)
        }


main : Program Never
main =
    Html.program
        { init = ( (), files cssFiles )
        , view = \_ -> (div [] [])
        , update = \_ _ -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        }
