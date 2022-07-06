import ballerina/io;

public function main() {
    final int i = 10;
    var foo = object {
        int j = i;

        function MyKFunc() returns int {
            int k = 20;

            var innerObjectCtor =  object {
                int j = i;
                function MyInner_KFunc() returns int {
                    int k_i = 20;
                    function () returns int xx = () => i + k_i + k;
                    return xx();
                }
            };
            return innerObjectCtor.MyInner_KFunc();
        }

    };
    io:println(foo.MyKFunc().toBalString());
}

type Foo object {
    function foo() returns int;
};
