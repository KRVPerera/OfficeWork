public function main() {
    int i = 10; // Unused variable
    Foo foo = object {
        function foo() returns int {
            function () returns int xx = () => i; // Runtime crash.
            return xx();
        }
    };
}

type Foo object {
    function foo() returns int;
};
