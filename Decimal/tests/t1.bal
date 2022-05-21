import ballerina/io;

public function main() {
    // 2147483647
    // -2147483648
    decimal number = 12.451;
    decimal x = 5.55;
    decimal y = 5.55;
    decimal z = y.round(2);
    io:println(x == y);
    io:println(x is anydata);
    io:println(z is anydata);
    io:println(x.toBalString());
    io:println(y.toBalString());
    io:println(z.toBalString());

}
