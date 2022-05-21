import ballerina/io;
import ballerina/lang.'decimal as decimals;

public function main() {
    decimal x = 555.545;
    decimal y = 5.5565;
    int fractionDigits = 3;

    io:println(555.545.round(1));	                     // 555.6
    io:println(decimals:round(x));	                   // 556
    io:println(decimals:round(x, fractionDigits = 0)); // 556
    io:println(decimals:round(x, 1));	                 // 555.6
    io:println(y.round(2));	                           // 5.56
    io:println(y.round(fractionDigits));	             // 5.556
}
