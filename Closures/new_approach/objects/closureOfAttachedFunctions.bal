import ballerina/io;
// import ballerina/lang.__internal;

public function main() {
    var foo = object {
        function getI() returns function () returns int {
            int p1 = 300;
            int p2 = 300;
            var func = function () returns int {
                return p1 + p2;
            };
            return func;
        }
    };

    var funcy = foo.getI();
    io:println(funcy());
}
