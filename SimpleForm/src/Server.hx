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

import tarantool.box.Box;
import tarantool.space.Space;
import chocolate.Chocolate.App;
import chocolate.Request;
import chocolate.response.Response;
import tarantool.index.IndexType;
import tarantool.index.IndexFieldType;
import tarantool.crypto.Digest;

import views.*;
import models.*;

using chocolate.MapHelper;

/**
 *  Simple server with form
 */
class Server {
    static function main() {
        Box.cfg ({
            listen : 65301
        });

        Box.once ("create", function () {
            var space = Space.getOrCreate ("registration");
            space.createIndex ("primary", {
                type : IndexType.Hash,
                parts : [
                    {
                        field_no : 1,
                        type : IndexFieldType.String
                    }
                 ]
            });
        });
        
        App.get ("/", function (r : Request) : Response {
            return new FormView ();
        });

        App.post ("/signup", function (r : Request) : Response {            
            // TODO: no error trace if box not run
            var space = Space.getByName ("registration");
            var reg = r.form.as (RegistrationData);
            var user = space.get (reg.email);            
            if (user != null) {
                return new MessageView ("User exists");
            } else {
                var hash = Digest.md5 (reg.password);
                reg.password = hash;
                space.insert (reg);
                return new MessageView ("Successful registration");
            }
        });

        App.post ("/signin", function (r : Request) : Response {
            var space = Space.getByName ("registration");
            var formLogin = r.form.as (LoginData);
            var user = space.get (formLogin.email).as (RegistrationData);            
            var message = "Wrong email or password";
            if (user == null) return new MessageView (message);            
            var hash = Digest.md5 (formLogin.password);
            if (hash == user.password) message = "Successful login";
            return new MessageView (message);
        });

        App.listen({
            Port : 8081,
            StaticDir : "./media"
        });
    }
}
