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

import zephyr.tag.*;
import zephyr.tag.link.*;
import zephyr.tag.form.*;
import zephyr.tag.button.*;
import zephyr.tag.input.*;
import zephyr.View;
import zephyr.HtmlBuilder.*;

/**
 *  Root view for others
 */
class RootView extends View {

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
                renderContent (),
                script ({ type : "text/javascript", src : "http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" }),
                script ({ type : "text/javascript", src : "./media/js/index.js" })                
            ])
        ]);
    }

    /**
     *  For override to child views
     *  @return Tag
     */
    public function renderContent () : Tag {
        throw "Not implemented";
    }
}