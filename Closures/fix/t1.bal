public function main() {
    int i = 10; // Unused variable
    Foo foo = object {
        function func() returns int {
            function () returns int xx = () => i; // Runtime crash.
            return xx();
        }
    };
    panic error(foo.func().toString());
}

type Foo object {
    function func() returns int;
};
