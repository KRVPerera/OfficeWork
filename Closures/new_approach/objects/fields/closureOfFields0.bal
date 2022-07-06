import ballerina/io;
// import ballerina/lang.__internal;

function TestFuncA(int k) returns int {
    var foo = object {
        int _k = k;
    };
    return foo._k;
}

public function main() {
    int x = TestFuncA(560);
    io:println(x);
}
