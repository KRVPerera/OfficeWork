import ballerina/io;

// import ballerina/lang.__internal;

function TestA(int gg) returns function (int y) returns function () returns int {
    // $map$func$_2 --- [gg] = gg

    var foo =
        function(int x) returns function () returns int { // lambda_0 // ($paramMap_1)
        // 1 -> $paramMap_1 --> added as argument
        // 3 --> $map$func$_4 --- [x] = x;
        // 4 --> $map$block$_4 --- [p1] = 300
        int p1 = 300;
        var func = function() returns int { // lambda_1 // ($paramMap$_4, $paramMap$_3, $paramMap_1)
            return p1 + x + gg; // $paramMap$_4[p1] + $paramMap$_3[x] + $paramMap_1[gg];
        };

        return func;
    };

    return foo;
}

public function main() {
    var foo = TestA(500);

    var funcy = foo(2);
    io:println(funcy());
}
