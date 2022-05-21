public type HSC record {|
    string hostRecField = "default_host_name";
    boolean boolRecField = true;
|};

public annotation HSC HSCsa on service;

function createService(string hosty, decimal maxAgeMy) returns service object {
    string xField;
} {
    // annotation_data[object] = {}
    // var httpService =
    // @HSCsa {
    //     hostRecField: hosty
    // }
    // isolated service object {

    //     final string xField = hosty;
    // };

    return @HSCsa {
        hostRecField: hosty
    }
    isolated service object {

        final string xField = hosty;
    };
}

public function testAnnotations() {
    var obj = createService("hostKRv", 200);

    typedesc<object {}> t = typeof obj;
    HSC annotationVal = <HSC>t.@HSCsa;

    obj = createService("hostKRv boom", 200);
    typedesc<object {}> t2 = typeof obj;
    HSC annotationVal2 = <HSC>t2.@HSCsa;
}
