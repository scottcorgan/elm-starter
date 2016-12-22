module Main exposing (..)

import String
import Html exposing (..)
import Navigation
import UrlParser exposing (Parser, (</>), format, int, oneOf, s, string)
import Page.Home as PageHome


main : Program Never
main =
    Navigation.program (Navigation.makeParser urlParser)
        { view = view
        , update = update
        , urlUpdate = urlUpdate
        , init = urlInit
        , subscriptions = subscriptions
        }



-- model


type alias Model =
    { currentPage : Page
    }


defaultModel : Model
defaultModel =
    { currentPage = Home
    }



-- update


type Msg
    = NoOp
    | NavigateTo Page


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        NavigateTo page ->
            model ! []



--[ Navigation.newUrl "/foods/new"
--]
-- navigation


type Page
    = Home


urlUpdate : Result String Page -> Model -> ( Model, Cmd Msg )
urlUpdate pageResult model =
    case pageResult of
        Ok page ->
            { model | currentPage = page } ! []

        Err _ ->
            model ! []



-- NOTE: this just takes a location and returns whatever the urlUpdate
--       function expects for the first argument


urlParser : Navigation.Location -> Result String Page
urlParser location =
    UrlParser.parse
        identity
        pageParser
        (String.dropLeft 1 location.pathname)


pageParser : Parser (Page -> a) a
pageParser =
    oneOf
        [ format Home (UrlParser.s "")
        ]


urlInit : Result String Page -> ( Model, Cmd Msg )
urlInit result =
    let
        ( initModel, initCmd ) =
            init

        ( updatedModel, urlCmd ) =
            urlUpdate result initModel
    in
        updatedModel ! [ initCmd, urlCmd ]



-- init


init : ( Model, Cmd Msg )
init =
    defaultModel ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- view


view : Model -> Html Msg
view model =
    case model.currentPage of
        Home ->
            PageHome.view
