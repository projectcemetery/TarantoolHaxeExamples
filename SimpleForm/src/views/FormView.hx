/*
 * Copyright (c) 2017 Grabli66
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package views;

import zephyr.tag.*;
import zephyr.tag.form.*;
import zephyr.tag.button.*;
import zephyr.tag.input.*;
import zephyr.HtmlBuilder.*;

/**
 *  Singin/singup form view
 */
class FormView extends RootView {

    /**
     *  Render field wrap
     *  @param text - 
     *  @param name - 
     *  @return Tag
     */
    private inline function fieldWrap (text : String, name : String, type : InputType = InputType.text) : Tag {
        return 
            div ({ css : "field-wrap" },[
                label ({ text : text },[
                    span ({ css : "req", text : "*" })
                ]),
                input({ type : type, required : true, autocomplete : true, name : name })
            ]);
    }

    /**
     *  Create sing in tab
     */
    private inline function singUpTab () : Tag {
        return 
                div ({ id : "signup", style : "display : block;" },[
                    h1 ({ text : "Sign Up for Free" }),
                    form ({ action : "/signup", method : FormMethodType.post },[
                        div ({ css : "top-row" },[
                            fieldWrap ("First Name", "firstName"),
                            fieldWrap ("Last Name", "lastName")
                        ]),
                        fieldWrap ("Email Address", "email", InputType.email),
                        fieldWrap ("Set A Password", "password", InputType.password),
                        button ({ css : "button button-block", text : "Get Started", type : ButtonType.submit })
                    ]),                            
                ]);
    }

    /**
     *  Create sing out tab
     */
    private inline function singInTab () : Tag {
        return 
                div ({ id : "signin", style : "display : none;" },[
                    h1 ({ text : "Welcome Back!" }),
                    form ({ action : "/signin", method : FormMethodType.post },[                        
                        fieldWrap ("Email Address", "email", InputType.email),
                        fieldWrap ("Password", "password", InputType.password),
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
    public override function renderContent () : Tag {
        return 
            div ({ css : "form" }, [
                ul ({ css : "tab-group" },[
                    li ({ css : "tab active" },[
                        a ({ href : "#signup", text : "Sign Up" })
                    ]),
                    li ({ css : "tab" },[
                        a ({ href : "#signin", text : "Log In" })
                    ])
                ]),
                div ({ css : "tab-content" },[
                    singUpTab (),
                    singInTab ()
                ]),                    
            ]);
    }
}