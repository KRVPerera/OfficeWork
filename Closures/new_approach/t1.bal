import ballerina/io;

type T T[]|int;

type MyFunc  function (int a, string b) returns int|string;
public function main() {
    T c = 33;

    io:println(c);
}