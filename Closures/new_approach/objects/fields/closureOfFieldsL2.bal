import ballerina/io;
// import ballerina/lang.__internal;

function TestFuncA(int k) returns int {
    final int p1 = 300;
    var foo =
        function() returns int { // lambda_0
            var foo = object {
                int _p1 = p1;
                int _k = k;
            };
            return foo._p1 + foo._k;
        };
    return foo();
}

public function main() {

    int x = TestFuncA(560);
    io:println(x);
}
