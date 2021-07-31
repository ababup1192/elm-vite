module MainTest exposing (..)

import Expect
import Fuzz exposing (string)
import Main exposing (Msg(..), update)
import Test exposing (..)


updateTest : Test
updateTest =
    describe "update test"
        [ describe "Draftが空文字列の時"
            [ test "DraftChanged abc すると、draftがabcになる" <|
                \_ ->
                    { draft = "", messages = [] }
                        |> update (DraftChanged "abc")
                        |> Tuple.first
                        |> Expect.equal { draft = "abc", messages = [] }
            ]
        , describe "messageが空で、Draftがabcの時"
            [ test "Send すると、draftが空文字列/messagesが[abc]になる" <|
                \_ ->
                    { draft = "abc", messages = [] }
                        |> update Send
                        |> Tuple.first
                        |> Expect.equal { draft = "", messages = [ "abc" ] }
            ]
        ]
