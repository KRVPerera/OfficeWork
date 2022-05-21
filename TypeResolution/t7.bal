public type Foo record {
    string code?;
    string message?;
};

public type Qux record {
    string code?;
    string message?;
};

public function main() {

    Qux[3] a = [];

    Foo[] f = a;
}
