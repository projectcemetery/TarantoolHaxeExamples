
import zephyr.tag.*;
import zephyr.tag.link.*;
import zephyr.tag.button.*;
import zephyr.View;
import zephyr.HtmlBuilder.*;

/**
 *  Sing in/sungup form view
 */
class FormView extends View {

    /**
     *  Render field wrap
     *  @return Tag
     */
    private inline function fieldWrap (text : String) : Tag {
        return 
            div ({ css : "field-wrap" },[
                label ({ text : text },[
                    span ({ css : "req", text : "*" })
                ]),
                input({ type : InputType.text, required : true, autocomplete : true })
            ]);
    }

    /**
     *  Create sing in tab
     */
    private inline function singUpTab () : Tag {
        return 
                div ({ id : "signup", style : "display : block;" },[
                    h1 ({ text : "Sign Up for Free" }),
                    form ({ action : "/singup", method : FormMethodType.post },[
                        div ({ css : "top-row" },[
                            fieldWrap ("First Name"),
                            fieldWrap ("Last Name")
                        ]),
                        fieldWrap ("Email Address"),
                        fieldWrap ("Set A Password"),
                        button ({ css : "button button-block", text : "Get Started", type : ButtonType.submit })
                    ]),                            
                ]);
    }

    /**
     *  Create sing out tab
     */
    private inline function singInTab () : Tag {
        return 
                div ({ id : "login", style : "display : none;" },[
                    h1 ({ text : "Welcome Back!" }),
                    form ({ action : "/login", method : FormMethodType.post },[                        
                        fieldWrap ("Email Address"),
                        fieldWrap ("Password"),
                        p ({ css : "forgot" },[
                            a ({ text : "Forgot Password?", href : "#" })
                        ]),
                        button ({ css : "button button-block", text : "Get Started", type : ButtonType.submit })
                    ]),                            
                ]);
    }

    /**
     *  Render view
     *  @return Tag
     */
    public override function render () : Tag {
        return html ([
            head ([                
                link ({ rel : LinkRelType.stylesheet, href : "http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600" }),
                link ({ rel : LinkRelType.stylesheet, href : "https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" }),
                link ({ rel : LinkRelType.stylesheet, href : "./media/css/style.css" })
            ]),
            body ([
                div ({ css : "form" }, [
                    ul ({ css : "tab-group" },[
                        li ({ css : "tab active" },[
                            a ({ href : "#signup", text : "Sign Up" })
                        ]),
                        li ({ css : "tab" },[
                            a ({ href : "#login", text : "Log In" })
                        ])
                    ]),
                    div ({ css : "tab-content" },[
                        singUpTab (),
                        singInTab ()
                    ]),                    
                ]),
                script ({ type : "text/javascript", src : "http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" }),
                script ({ type : "text/javascript", src : "./media/js/index.js" })
            ])
        ]);
    }
}