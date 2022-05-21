public function main() {
    int i = 10; // Unused variable
    var foo =
        function() returns int {
        function () returns int xx = () => i; // Runtime crash.
        return xx();
    };
    panic error(foo().toString());
}

type Foo object {
    function foo() returns int;
};
