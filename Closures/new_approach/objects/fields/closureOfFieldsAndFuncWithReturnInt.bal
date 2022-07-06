import ballerina/io;
// import ballerina/lang.__internal;

function TestFuncA() returns int {
    final int p1 = 300;
    var foo = object {
        int _p1 = p1;
        function getI() returns int {
            return p1;
        }
    };
    return foo._p1 + foo.getI();
}

public function main() {

    int x = TestFuncA();
    io:println(x);
}
