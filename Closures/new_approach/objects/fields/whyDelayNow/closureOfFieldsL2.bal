import ballerina/io;
// import ballerina/lang.__internal;

function TestFuncA(int k) returns int {
    final int p1 = 100;
    var foo =
        function(int k2) returns int { // lambda_0
            var foo = object {
                int _p1 = p1;
                int _k = k;
            };
            io:println("#### values inside object ctor START ####");
            io:println(foo._p1);
            io:println(foo._k);
            io:println(k);
            io:println(k2);
            io:println("#### values inside object ctor END ####");
            return foo._p1 + foo._k + k + k2; // 100 + 100 + 100 + 100 ==> 400
        };


    // var fooFunc =
    //     function(int x) returns function () returns int { // lambda_0
    //     // 1 -> $paramMap_1 --> added as argument
    //     // $map$func$_4 --- [x] = x;
    //     // $map$block$_4 --- [p1] = 300
    //     int p3 = 200;
    //     var func = function() returns int { // lambda_1

    //         io:println("\n----- values inside LAMBDAs START ----");
    //         io:println(p1);
    //         io:println(x);
    //         io:println(k);
    //         io:println(p3);
    //         io:println("----- values inside LAMBDAs END -----");

    //         return p1 + x + k + p3 ; // $paramMap$_4[p1] + $paramMap$_3[x] + $paramMap_1[gg];
    //         // 100 + 200 + 100 + 200 ==> 600 
    //     };

    //     return func;
    // };

    // var innerFunc = fooFunc(200);
    // var  innerFuncResult = innerFunc();
    var objectResult = foo(100);
    int res = objectResult;
    // res += innerFuncResult;
    io:println("------ final results ------");
    // io:println(innerFuncResult);
    io:println(objectResult);
    return res;
}

public function main() {
    int k = 100;
    int x = TestFuncA(k);
    io:println(x);
}
