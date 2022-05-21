public type HSC record {|
    string hostRecField = "default_host_name";
    boolean boolRecField = true;
|};

public annotation HSC HSCfa on object field;
public annotation HSC HSCfm on object function;
public annotation HSC HSCsa on class;

@HSCsa {
        hostRecField : "sadf"
    }
service class C1 {

    final string xField = "fields";

        @HSCfm {
            hostRecField : "methods"
        }
        public function getSum() returns int {
            return 1 + 3;
        }
}

function createService(string hosty, decimal maxAgeMy, boolean allowCredentials) returns service object {
    string xField;
    public function getSum() returns int;
} {

    var httpService = new C1();
    return httpService;
}

public function main() {
    var obj = createService("hostKRv", 200, true);
    assertValueEquality("fields", obj.xField);

    typedesc<any> t = typeof obj.getSum;
    HSC annotationVal = <HSC>t.@HSCfm;
}

type AssertionError distinct error;
const ASSERTION_ERROR_REASON = "AssertionError";

function assertValueEquality(anydata expected, anydata actual) {
    if expected == actual {
        return;
    }
    panic error(ASSERTION_ERROR_REASON,
                message = "expected '" + expected.toString() + "', found '" + actual.toString () + "'");
}
