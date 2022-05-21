type Foo record {
    int x = 1;
};

public function anonymousRecordWithTypeInclusion() {
    var rec = <record { *Foo; }>{
        x: 3
    };
    rec.x = 5;
}

