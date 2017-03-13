import chocolate.Chocolate.App;
import chocolate.Request;
import chocolate.Response;

class Main {
    static function main() {
        App.get ("/", function (r : Request) : Response {            
            return "GOOD";
        });

        App.listen({
            Port : 65201            
        });
    }
}
