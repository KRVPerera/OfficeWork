int i = 0;

public function main() {
    int i = 100; // $map$block$_2[i] = 10
    var foo = name();
    panic error(foo().toString());
}

function name() returns function () returns int {
    int i = 300;
    var foo = function() returns int {
        function () returns int xx = () => i; // Runtime crash.
        return xx();
    };
    return foo;
}
