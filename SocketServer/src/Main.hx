import tarantool.socket.TcpSocket;

class Main {
    static function main() {
        var socket = new TcpSocket ();
        socket.bind ("*", 65200, function (s : TcpSocket) {            
            trace ("Client accepted");
            var dat = s.input.readLine ();            
            trace ('client sent $dat');
            s.output.writeString ("GOOD");
        });
        trace ("Server opened on *:65200");
    }
}
