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

import js.jquery.JQuery;

/**
 *  Simple client for form
 */
class Client {

    /**
     *  Init input logic
     */
    static function initInputs () {
        var elements = new JQuery (".form").find ("input, textarea");        
        elements.on ('keyup blur focus', function (e) {
            var self = new JQuery (e.target);
            var label = self.prev ('label');

            if (e.type == "keyup") {
                if (self.val () == "") {
                    label.removeClass ("active highlight");
                } else {
                    label.addClass ("active highlight");
                }
            } else if (e.type == "blur") {
                if (self.val () == "") {
                    label.removeClass ("active highlight");
                } else {
                    label.removeClass ("highlight");
                }
            } else if (e.type == "blur") {
                if (self.val () == "") {
                    label.removeClass ("highlight");
                } else {
                    label.addClass ("highlight");
                }
            }
        });
    }

    /**
     *  Init input logic
     */
    static function initTabs () {
        new JQuery (".tab a").click (function (e) {
            e.preventDefault ();
            var self = new JQuery(e.target);
            self.parent ().addClass ("active");
            self.parent ().siblings ().removeClass ("active");
            var target = self.attr ("href");
            new JQuery (".tab-content > div").not (target).hide ();
            new JQuery (target).fadeIn (600);
        });
    }

    /**
     *  On document ready
     */
    static function onReady () {
        initInputs (); 
        initTabs ();             
    }

    static function main() {        
        // On ready
        new JQuery (function () {
            onReady ();
        });
    }
}