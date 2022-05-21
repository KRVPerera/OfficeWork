import ballerina/io;

public function main() {
    io:println("Hello, World!");

    decimal d1 = 504023030303030303030.3035;
    decimal rounded = decimal:round(d1, 3);
    io:println(rounded);
}

const ASSERTION_ERROR_REASON = "AssertionError";

function assertTrue(any|error actual) {
    if actual is boolean && actual {
        return;
    }

    string actualValAsString = "";
    if (actual is error) {
        actualValAsString = actual.toString();
    } else {
        actualValAsString = actual.toString();
    }

    panic error(ASSERTION_ERROR_REASON,
                message = "expected 'true', found '" + actualValAsString + "'");
}

function assertFalse(any|error actual) {
    if actual is boolean && !actual {
        return;
    }

    string actualValAsString = "";
    if (actual is error) {
        actualValAsString = actual.toString();
    } else {
        actualValAsString = actual.toString();
    }

    panic error(ASSERTION_ERROR_REASON,
                message = "expected 'false', found '" + actualValAsString + "'");
}

isolated function isEqual(anydata|error actual, anydata|error expected) returns boolean {
    if (actual is anydata && expected is anydata) {
        return (actual == expected);
    } else {
        return (actual === expected);
    }
}

function assertValueEquality(anydata|error expected, anydata|error actual) {
    if isEqual(actual, expected) {
        return;
    }

    string expectedValAsString = expected is error ? expected.toString() : expected.toString();
    string actualValAsString = actual is error ? actual.toString() : actual.toString();
    panic error(ASSERTION_ERROR_REASON,
                message = "expected '" + expectedValAsString + "', found '" + actualValAsString + "'");
}
