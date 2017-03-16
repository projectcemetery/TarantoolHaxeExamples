
import zephyr.tag.*;
import zephyr.View;
import zephyr.HtmlBuilder.*;

/**
 *  Sing in/sungup form view
 */
class FormView extends View {
    public override function render () : Tag {
        return html ([
            head ([
                link ({ rel : LinkRelType.Stylesheet ,  href : "./css/style.css" })
            ]),
            body ([
                div ({ css : "form" }, [
                    ul ({ css : "tab-group" }, [
                        li ({ css : "tab active" },[
                            a ({ href : "#signup", text : "Sign Up" })
                        ]),
                        li ({ css : "tab" },[
                            a ({ href : "#login", text : "Log In" })
                        ])
                    ]),
                    div ({ css : "tab-content" },[
                        div ({ id : "signup" }, [
                            h1 ({ text : "Sign Up for Free" })
                        ])
                    ])
                ])
            ])
        ]);
    }
}