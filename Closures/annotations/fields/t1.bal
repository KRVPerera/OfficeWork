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
    };

    return httpService;
}


