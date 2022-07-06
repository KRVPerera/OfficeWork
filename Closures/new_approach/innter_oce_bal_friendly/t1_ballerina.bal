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
        var innerObjectCtor = new Inner_Class(globalMap);
        return iplusK();
    }

}

class Inner_Class {
    int j;

    function init(map<any> mm) {
        self.j = <int>mm["i"];
        globalMap["Inner_Class.i"] = <int>mm["i"]; // make available to attached func
    }

    function MyInner_KFunc() returns int {
        globalMap["Foo.MyInner_KFunc.k"] = 20; // make available to inner scopes
        function () returns int xx = () => i + globalMap["Foo.MyInner_KFunc.k"] + k;
        return iplusK();
    }

}
