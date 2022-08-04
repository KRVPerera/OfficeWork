// import ballerina/lang.__internal;
import ballerina/io;

public function test() {
    int k = 3;                                                      // 1    
    var foo = object {
        function getI(int y) returns function () returns int {      // 2
                                                                    // 3
            // map<any|error> $paramMap$_1 = _internal:maps(1);
            var func = function () returns int {                    // 4
                return y + k;                 // $paramMap$_1[y]    // 5
            };
            return func;
        }
    };

    var funcy = foo.getI(500);
    io:println(funcy());
}

public function main() {
    test();
}