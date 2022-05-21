public type Foo record {|
    anydata body;
|};

// Works when defined before `Bar`.
// type Baz record {|
//     int id;
// |};

type Bar record {|
    *Foo;
    Baz body;
|};

type Baz record {|
    int id;
|};
