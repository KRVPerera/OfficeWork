import ballerina/io;
// import ballerina/lang.__internal;

public function main() {
    var foo = 
        function () returns function () returns int {
            int p1 = 300;
            int p2 = 400;
            var func = function () returns int {
                return p1 + p2;
            };
            return func;
        };
    
    var funcy = foo();
    io:println(funcy());
}
