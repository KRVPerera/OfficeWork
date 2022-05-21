annotation W on type, class, service;

annotation map<int> X on record field;

annotation map<string> Y on object field;

annotation Z on field;

@W
class Bar {
    @Y {
        q: "hello",
        r: "world"
    }
    @Z
    int j = 1;
}

@W
service class Ser {
    @Z
    int j = 1;
}

int glob = 2;

public function testStructureAnnots() returns [typedesc<object {}>, typedesc<service object {}>] {
    glob = 123;

    Bar b = new;

    var bar = @W service object {
        @Y {
            q: "hello",
            r: "world"
        }
        @Z
        int j = 1;
    };

    return [typeof b, typeof bar];
}
