import ballerina/io;

public function main() {
    var d = 12345D;
     io:println(d is decimal);
}