import ballerina/io;
// import ballerina/lang.__internal;

public function main() {
    var foo = 
        function (int x) returns function () returns int {
            int p1 = 300;
            var func = function () returns int {
                return p1 + x;
            };
            
            return func;
        };
    
    var funcy = foo(2);
    io:println(funcy());
}
