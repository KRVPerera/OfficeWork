
function testInvalidIntersection() {
    var fn = function () returns int { return 1; };
    future<int> & readonly x = start fn();
}

function testUnsupportedIntersection() {
    json & int x = 1;
}

type IntersectionWithInvalidRecordTypeAfter Bar & readonly;

type Bar record {
    future<int> ft;
};

type IntersectionWithInvalidObjectTypeAfter Baz & readonly;

type Baz object {
    future<int> ft;
};

type X error<record { int i?; }> & error<record { int i; }>;
type Y readonly & record { int i; };

type Z record {
    *Y;
    X x;
    Y y;
};

