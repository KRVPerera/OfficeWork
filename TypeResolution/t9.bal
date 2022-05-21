public type Foo record {
    string code?;
    string message?;
};

public type Bar record {
    string processId?;
    Qux[] reasons?;
    boolean success?;
};

public type Baz record {
    *Bar;
    string id?;
    Foo[] reasons?;
};

public type Qux record {
    string code?;
    string message?;
};
