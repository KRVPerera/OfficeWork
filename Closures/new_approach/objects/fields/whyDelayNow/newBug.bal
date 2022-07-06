import ballerina/io;

function TestFuncA(int k) returns int {
    final int p1 = 100;
    var foo =
        function(int k2) returns int { // lambda_0
          // $map$func$_3 
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



    var objectResult = foo(100);
    int res = objectResult;
    io:println("------ final results ------");
    io:println(objectResult);
    return res;
}

function TestFuncB() returns int {
    final int p1 = 100; // map<any|error> $map$block$3[p1] = 100
    var foo =
        function(
            // map<any|error> $paramMap$3
        ) returns int { // lambda_0


            var foo = object {

                // reference to blockMap
                // reference to functionMap
                // reference[] to paramMaps

                int _p1 = p1;
            };
            io:println("#### values inside object ctor START ####");
            io:println(foo._p1);
            io:println("#### values inside object ctor END ####");
            return foo._p1 + p1; // 100 + 200 but 0 + 200
            // -- + $paramMap$3[p1]
        };



    var objectResult = foo();
    int res = objectResult;
    io:println("------ final results ------");
    io:println(objectResult);
    return res;
}

public function main() {
    // int k = 100;
    // int a = TestFuncA(k);
    int b = TestFuncB();
    // io:println("a : " + a.toBalString());
    io:println("b : " + b.toBalString());
}
