import ballerina/io;
import ballerina/lang.'float as floats;

public function main() {
    float x = 555.545;
    float y = 5.5565;
    int fractionDigits = 3;

    io:println(555.545.round(1));	                    // 555.5
    io:println(555.545.round(2));	                    // 555.54
    io:println(floats:round(x));	                    // 556.0
    io:println(floats:round(x, fractionDigits = 0));  // 556.0
    io:println(floats:round(x, 1));	                  // 555.5
    io:println(y.round(2));	                          // 5.56
    io:println(y.round(fractionDigits));	            // 5.556
}
