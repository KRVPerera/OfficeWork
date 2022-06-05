public function main() {
    map<int> bmap = {};
    bmap["i"] = 10;

    var foo = new Foo(bmap);
}

class Foo {
    map<int> oceMap;

    function init(map<int> mm) {
        self.oceMap = mm;
    }
}
