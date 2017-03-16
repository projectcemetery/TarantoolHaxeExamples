import chocolate.Chocolate.App;
import chocolate.Request;
import chocolate.response.Response;

class Main {
    static function main() {
        App.get ("/", function (r : Request) : Response {            
            return new FormView ();
        });

        App.listen({
            Port : 65201,
            StaticDir : "css"
        });
    }
}
