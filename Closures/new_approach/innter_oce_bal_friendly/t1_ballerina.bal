import ballerina/io;

map<any> globalMap = {};

public function main() {
    map<any> topMap = {};
    topMap["i"] = 10; // int i = 10;

    var foo = new Foo(topMap);

    io:println(foo.MyKFunc().toBalString());
}

class Foo {
    int j;

    function init(map<any> mm) {
        self.j = <int>mm["i"];
        globalMap["Foo.i"] = <int>mm["i"]; // make available to attached func
    }

    function MyKFunc() returns int {
        globalMap["Foo.MyFunc.k"] = 20; // make available to inner scopes
        function () returns int iplusK = () => <int>globalMap["Foo.i"]
                                                + <int>globalMap["Foo.MyFunc.k"];
        return iplusK();
    }

}
