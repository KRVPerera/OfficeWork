// import ballerina/lang.__internal;
import ballerina/io;

public function main() {
    var foo = object {
        function getI(int x, int y) returns function () returns int {
            int p1 = 300;
            int p2 = 200;
            var func = function () returns int {
                return p1 + p2 + x + y;
            };
            return func;
        }
    };

    var funcy = foo.getI(500, 23);
    io:println(funcy());
}
