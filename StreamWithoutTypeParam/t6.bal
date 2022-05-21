import ballerina/io;

public function testErrorStreamTypeAssignedToStreamWithoutParams() {
    error[] errorList = [];
    foreach int i in 0 ... 2 {
        errorList.push(error(i.toBalString()));
    }

    stream errorStream = errorList.toStream();
    assertTrue(getNextErrorValue(errorStream) === errorList[0]);
    assertTrue(getNextErrorValue(errorStream) === errorList[1]);
    assertTrue(getNextErrorValue(errorStream) === errorList[2]);
    assertTrue(getNextErrorValue(errorStream) == ());
    io:println(errorList);
    io:println(getNextErrorValue(errorStream));
}

function getNextErrorValue(stream errorStream) returns error? {

    record {error|any value;}|error? val = errorStream.next();

    if (val is ()) {
        return;
    }
    if (val is error) {
        return val;
    }
    return <error>val.value;
}

public function main() {
    testErrorStreamTypeAssignedToStreamWithoutParams();
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
