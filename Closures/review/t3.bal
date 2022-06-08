import ballerina/io;

public function main() {
    int|string a = 1;

    io:println(a is int);
}