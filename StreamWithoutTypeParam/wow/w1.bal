type ResultValue record {|
    int value;
|};

class EvenNumberGenerator {
    int i = 0;
    public isolated function next() returns record {|int value;|}|error? {
        self.i += 2;
        return {value: self.i};
    }
}

function getRecordValue((record {|int value;|}|error?)|(record {|int value;|}?) returnedVal) returns ResultValue? {
    if (returnedVal is ResultValue) {
        return returnedVal;
    } else {
        return ();
    }
}

// EvenNumberGenerator evenGen = new ();
// stream<int, error?> evenNumberStream = new (evenGen);

function testImplicitNewExprToStreamWithoutParams() {
    EvenNumberGenerator evenGen = new ();
    stream localEvenNumberStream = new stream<int, error?>(evenGen);
    assertValueEquality(2, getRecordValue(localEvenNumberStream.next())?.value);
    assertValueEquality(4, getRecordValue(localEvenNumberStream.next())?.value);

    stream<int, error?> possibleErroneousStream = <stream<int, error?>>localEvenNumberStream;
    assertValueEquality(6, getRecordValue(localEvenNumberStream.next())?.value);
    assertValueEquality(8, getRecordValue(localEvenNumberStream.next())?.value);
}

public function main() {
    testImplicitNewExprToStreamWithoutParams();
    testImplicitNewExprToStreamWithoutParams();
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
