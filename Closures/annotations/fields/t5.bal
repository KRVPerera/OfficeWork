public type HSC record {|
    string hostRecField = "default_host_name";
    boolean boolRecField = true;
|};

public annotation HSC HSCfa on field;

public annotation HSC HSCsa on class;

function createService(string hosty, decimal maxAgeMy, boolean allowCredentials) returns object {
    string xField;
} {

    var httpService =
    @HSCsa {
        hostRecField: hosty
    }
    isolated object {

        @HSCfa {
            hostRecField: hosty
        }
        final string xField = hosty;
    };

    return httpService;
}

public function testAnnotations() {
    var obj = createService("hostKRv", 200, true);
    assertValueEquality("hostKRv", obj.xField);

    typedesc<object {}> t = typeof obj;
    HSC annotationVal = <HSC>t.@HSCsa;
    assertValueEquality("hostKRv", annotationVal.hostRecField);

    obj = createService("hostKRv boom", 200, true);
    assertValueEquality("hostKRv boom", obj.xField);
    typedesc<object {}> t2 = typeof obj;
    HSC annotationVal2 = <HSC>t2.@HSCsa;
    assertValueEquality("hostKRv boom", annotationVal2.hostRecField);
}

public function main() {
    testAnnotations();
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
