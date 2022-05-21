public function main() {
    int i = 10; // $map$block$_2[i] = 10
    var foo = function() returns int {
        function () returns int xx = () => i; // Runtime crash.
        return xx();
    };
}

