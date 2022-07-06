
// import ballerina/io;
§§§§§
public function test() returns int {
    int i = 10; 
    var func = function () returns int {
        int x = i;
        // i = 5;
        return x;
    };

    // io:println(i);§§
    // io:println(func().toString());
    // io:println(i);
    return func();
}

public function main() {
    var x = test();
}