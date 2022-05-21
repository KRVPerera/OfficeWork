type Rec1 record {|
    int i;
    string...;
|};


type IncludingRec1 record {|
    boolean b;
    *Rec1;
|};

function testRestTypeOverriding() {
    IncludingRec1 r1 = {b: false, i: 1, "s": "str"};
}
