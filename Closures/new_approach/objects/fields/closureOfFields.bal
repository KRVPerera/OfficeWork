
function TestFuncA(int k) returns int {
    final int p1 = 300;
    var foo = object {
        int _p1 = p1;
        int _k = k;
    };
    return foo._p1 + foo._k;
}

public function main() {
    int x = TestFuncA(560);
}
