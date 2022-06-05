public function main() {
    map<int> bmap = {};
    bmap["i"] = 10;

    var foo = new Foo(bmap);
    panic error(foo.MyFunc().toString());
}

class Foo {
    map<int> oceMap;

    function init(map<int> mm) {
        self.oceMap = mm;
    }

    function MyFunc() returns int {
        function () returns int xx = () => <int>self.oceMap["i"]; // Runtime crash.
        return xx();
    }
}
