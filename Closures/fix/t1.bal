public function main() {
    int i = 10; // Unused variable
    var foo = object {
        function MyFunc () returns int {
            int x = i;
            function () returns int xx = () => i; // Runtime crash.
            return xx();
        }
    };
    panic error(foo.MyFunc().toString());
}

type Foo object {
    function foo() returns int;
};
