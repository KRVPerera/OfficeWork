public function main() {
    // any t1 = table []; // error: cannot infer the member type from table constructor; no values are provided in table constructor

    any t2 = table [{a: 1}];
    table<map<any|error>> t3 = <table<map<any|error>>> t2;

    map<any|error> m = {a: error("")};
    t3.add(m); // panic: value type 'map<(any|error)>' inconsistent with the inherent table type 'table<record {| int a; |}>'
}
