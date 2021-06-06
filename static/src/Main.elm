module Main exposing (main)

import Browser
import Browser.Navigation
import Html exposing (a, button, div, h1, h3, img, p, text)
import Html.Attributes exposing (class, href, src)
import Http
import Markdown.Block exposing (Block)
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer
import Url
import Url.Builder
import Url.Parser exposing ((</>), Parser, int, map, oneOf, parse, s)


type Msg
    = NoOp
    | UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | GotLesson (Result Http.Error String)


type Page
    = Home
    | Lessons
    | Lesson Int
    | Question


type Model
    = Model Page Browser.Navigation.Key (Maybe String)


main : Program () Model Msg
main =
    Browser.application
        { view = view
        , update = update
        , init = init
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- onUrlChange : Url.Url -> Msg
-- onUrlChange url =
--     case parse route url of
--         Just Home ->
--             UrlChanged Home
--         Just Lesson ->
--             UrlChanged Lesson
--         Nothing ->
--             UrlChanged Home


view : Model -> Browser.Document Msg
view (Model p _ s) =
    case p of
        Home ->
            { title = "t3kroots"
            , body =
                [ div [ class "container" ]
                    [ header
                    , splash
                    , schedule
                    , lessons
                    , resources
                    ]
                ]
            }

        Lessons ->
            { title = "t3kroots - Lessons"
            , body =
                [ div [ class "container" ]
                    [ header
                    , lessons
                    ]
                ]
            }

        Question ->
            { title = "t3kroots - Question"
            , body =
                [ div []
                    [ header
                    , section "Got a Question?"
                        [ h3 [] [ text "You can send me an email at help@t3kroots.com" ]
                        ]
                    ]
                ]
            }

        Lesson i ->
            let
                mdt =
                    case s of
                        Nothing ->
                            "kkl;lk"

                        Just r ->
                            r

                idk =
                    case show mdt of
                        Ok sdc ->
                            div [ class "article" ] sdc

                        Err e ->
                            div [] [ text "Not Found" ]
            in
            { title = "t3kroots - Lesson " ++ String.fromInt i
            , body =
                [ div [class "container"]
                    [ header, idk ]
                ]
            }


show markdown =
    markdown
        |> Markdown.Parser.parse
        |> Result.mapError (\x -> "s")
        |> Result.andThen (\ast -> Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer ast)


getLesson : Int -> Cmd Msg
getLesson i =
    Http.get
        { url = Url.Builder.absolute [ "lessons", "lesson" ++ String.fromInt i ++ ".md" ] []
        , expect = Http.expectString GotLesson
        }


schedule : Html.Html Msg
schedule =
    div [ class "schedule schedule--light" ]
        [ h1 [ class "schedule__title" ] [ text "Meeting Schedule" ]
        , div [ class "schedule__days" ]
            [ h3 [] [ text " Sunday 3-4pm EST" ]
            , h3 [] [ text " Tuesday 4:30-5:30pm EST" ]
            ]
        , a [ href "https://meet.google.com/vdp-jwry-gwy", class "schedule__button" ] [ text "Join Now" ]
        ]


lessons : Html.Html Msg
lessons =
    section "Lessons"
        [ lesson
            1
            "https://s3-us-west-2.amazonaws.com/courses-images/wp-content/uploads/sites/1861/2017/06/23161835/apple-slicing-function.png"
            "What is a Function"
            "What is a Function? Input and Ouput",
         lesson
            2
            "https://media3.giphy.com/media/lyLRTrqRpW8YU/200w.gif?cid=82a1493beh7268a8wrtwhk5ehd9lui9z4hy2hgrgqlw1nwp7&rid=200w.gif"
            "Values in Python"
            "Values in Python"
        ]


resources : Html.Html Msg
resources =
    section "Resources"
        [ card "http://replit.com" "https://replit.com/public/images/blog/multi.png" "Practice with ReplIt" "Repl" "Start Practicing"
        , card "question" "https://media0.giphy.com/media/sxERTFNh52gJzVHVU4/200.gif" "Need Help" " Contact Me" " Contact Me"
        ]


section : String -> List (Html.Html Msg) -> Html.Html Msg
section title_ content_ =
    div [ class "section" ]
        [ h1 [ class "section__title" ] [ text title_ ]
        , div [ class "section__row" ]
            content_
        ]


lesson : Int -> String -> String -> String -> Html.Html Msg
lesson num photo_url name desc_ =
    card
        (Url.Builder.absolute [ "lesson", String.fromInt num ] [])
        photo_url
        name
        desc_
        ("Lesson " ++ String.fromInt num)


card link_ photo_ title_ subtitle_ buttont_ =
    div [ class "card" ]
        [ h3 [ class "card__title" ]
            [ text title_ ]
        , img
            [ class "card__image"
            , src photo_
            ]
            []
        , div [ class "card__content" ]
            [ p [ class "card__text" ]
                [ text subtitle_ ]
            ]
        , a [ href link_, class "card__button" ] [ text buttont_ ]
        ]


header : Html.Html Msg
header =
    div [ class "header header--light" ]
        [ div [ class "header__items" ]
            [ div [ class "header__brand" ]
                [ a [ href "/", class "header--light header__links__item" ] [ text "Home" ]
                ]
            , div [ class "header__links" ]
                [ a [ class "header__links__item header--light", href "/lessons" ] [ text "Lessons" ]
                ]
            ]
        ]


splash : Html.Html Msg
splash =
    div [ class "splash splash--light" ]
        [ img
            [ class "splash__image", src "/img/programming.svg" ]
            []
        , div [ class "splash__title" ]
            [ h1 [][text "t3kRoots"]
            , a [ href "/lessons", class "splash__button" ] [ text "Start Learning" ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg (Model p k md) =
    case msg of
        NoOp ->
            ( Model p k md, Cmd.none )

        UrlChanged p1 ->
            let
                newpage =
                    route p1

                nCmd =
                    case newpage of
                        Lesson s ->
                            getLesson s

                        _ ->
                            Cmd.none
            in
            ( Model newpage k md, getLesson 1 )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( Model p k md
                    , Browser.Navigation.pushUrl k (Url.toString url)
                    )

                Browser.External url ->
                    ( Model p k md
                    , Browser.Navigation.load url
                    )

        GotLesson les ->
            case les of
                Ok s ->
                    ( Model p k (Just s), Cmd.none )

                Err e ->
                    ( Model p k Nothing, Cmd.none )


init : flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url navkey =
    let
        nroute =
            route url

        ncmd =
            case nroute of
                Lesson i ->
                    getLesson i

                _ ->
                    Cmd.none
    in
    ( Model nroute navkey Nothing, ncmd )


route : Url.Url -> Page
route url =
    case parse routes url of
        Just x ->
            x

        Nothing ->
            Home


routes : Parser (Page -> a) a
routes =
    oneOf
        [ map Home (s "")
        , map Lessons (s "lessons")
        , map Lesson (s "lesson" </> int)
        , map Question (s "question")
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
