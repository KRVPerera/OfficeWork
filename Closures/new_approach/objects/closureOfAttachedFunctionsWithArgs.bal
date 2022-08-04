
public function testAttachedFunctionWithArgs() {
    var foo = object {
        function getI(int x) returns function () returns int {
            int p1 = 200;
            var func = function() returns int => p1 + x;
            return func;
        }
    };

    var funcy = foo.getI(23);
    assertValueEquality(23, funcy());
}

public function testAttachedFunction() {
    var foo = object {
        function getI() returns function () returns int {
            int p1 = 300;
            int p2 = 300;
            var func = function() returns int {
                return p1 + p2;
            };
            return func;
        }
    };

    var funcy = foo.getI();
    assertValueEquality(23, funcy());
}

public function main() {
    testAttachedFunction();
    testAttachedFunctionWithArgs();
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
