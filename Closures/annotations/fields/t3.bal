public type HSC record {|
    string hostRecField = "default_host_name";
    boolean boolRecField = true;
|};

public annotation HSC HSCfa on field;

public annotation HSC HSCsa on service;

function createService(string hosty, decimal maxAgeMy, boolean allowCredentials) returns service object {
    string xField;
} {

    var httpService =
    @HSCsa {
        hostRecField: hosty
    }
    isolated service object {

        @HSCfa {
            hostRecField: hosty
        }
        final string xField = hosty;

        @HSCfa {
            hostRecField: hosty
        }
        final string yField = hosty;
    };

    return httpService;
}

// public function testAnnotations(string value) {
//     var obj = createService(value, 200, true);
//     //assertValueEquality(value, obj.xField);

//     typedesc<object {string xField;}> t = typeof obj;
//     HSC annotationVal = <HSC>t.@HSCsa;
//     // assertValueEquality(value, annotationVal.hostRecField);

//     typedesc<string> st = typeof obj.xField;
//     HSC fieldAnnotationVal = <HSC>st.@HSCfa;
//     // assertValueEquality(value, fieldAnnotationVal.hostRecField);
// }

// public function main() {
//     testAnnotations("boom var");
// }

