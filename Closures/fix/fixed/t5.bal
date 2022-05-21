final int i = 100;
final int k = 200;

function test() {
    final int i = 10;
    object {
        int x;
        function bar(int b) returns int;

    } bOceVariable = object {
        int x = i;

        function bar(int b) returns int {
            return b + i;
        }
    };

    var lambda = bOceVariable.bar;
    int y = lambda(45);
    assertValueEquality(10, bOceVariable.x);
    assertValueEquality(55, y);

    var inferredObj = object {
        int x = i;

        function bar(int b) returns int {
            return b + i;
        }
    };

    lambda = inferredObj.bar;
    y = lambda(45);

    assertValueEquality(10, inferredObj.x);
    assertValueEquality(55, y);
}

public function main() {
    test();
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
