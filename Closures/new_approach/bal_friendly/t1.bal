import ballerina/io;

public function main() {
    final int i = 10;
    var foo = object {
        int j = i;

        function MyKFunc() returns int {
            int k = 20;
            function () returns int xx = () => i + k;
            return xx();
        }

        function MyJFunc() returns int {
            int k = 30;
            function () returns int xx = () => i + k;
            return xx();
        }

        function MyKFunc_innerFunc() returns function () returns int {
            int k = 200; // make available to inner scopes
            function () returns int iplusK = () => i + k;
            return iplusK;
        }
    };
    io:println(foo.MyKFunc().toBalString());
    io:println(foo.MyJFunc().toBalString());

    var innerFunc = foo.MyKFunc_innerFunc();
    io:println(innerFunc().toBalString()); 
}

type Foo object {
    function foo() returns int;
};
