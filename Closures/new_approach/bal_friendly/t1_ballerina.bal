import ballerina/io;

map<any> globalMap = {};

public function main() {
    map<any> topMap = {};
    topMap["i"] = 10; // int i = 10;

    var foo = new Foo(topMap);

    io:println(foo.MyKFunc().toBalString());
    io:println(foo.MyJFunc().toBalString());

    var innerFunc = foo.MyKFunc_innerFunc();
    io:println(innerFunc().toBalString()); 
}

class Foo {
    int j;
    // map<any> mapC;

    function init(map<any> mm) {
        self.j = <int>mm["i"];
        globalMap["Foo.i"] = <int>mm["i"]; // make available to attached func
    }

    function MyKFunc() returns int {
        map<any> MyKFunc = {};
        MyKFunc["k"] = 20;
        MyKFunc["i"] = <int>globalMap["Foo.i"];

        function () returns int iplusK = () => <int>MyKFunc["i"]
                                                + <int>MyKFunc["k"];
        return iplusK();
    }

    function MyJFunc() returns int {
        map<any> MyJFunc = {};
        MyJFunc["j"] = 20;
        MyJFunc["i"] = <int>globalMap["Foo.i"];

        function () returns int iplusJ = () => <int>MyJFunc["i"] 
                                                + <int>MyJFunc["j"];
        return iplusJ();
    }

    function MyKFunc_innerFunc() returns function () returns int {
        map<any> MyKFunc_innerFunc = {};
        MyKFunc_innerFunc["k"] = 200;
        MyKFunc_innerFunc["i"] = <int>globalMap["Foo.i"];

        function () returns int iplusK = () => <int>MyKFunc_innerFunc["i"]
                                                + <int>MyKFunc_innerFunc["k"];
        return iplusK;
    }
}
