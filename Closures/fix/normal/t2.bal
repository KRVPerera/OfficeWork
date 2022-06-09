map<int> globalMap = {};

public function main() {
    map<int> topMap = {};
    topMap["i"] = 10;     // int i = 10;

    var foo = new Foo(topMap);
    panic error(foo.MyFunc().toString());
}

class Foo {
    int j;

    function init(map<int> mm) {
        self.j = <int>mm["i"];
        globalMap["MyFunc.i"] = <int>mm["i"];
    }

    function MyFunc() returns int {
        function () returns int xx = () => <int>globalMap["MyFunc.i"]; // Runtime crash.
        return xx();
    }
}