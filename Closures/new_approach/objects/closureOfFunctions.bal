// import ballerina/lang.__internal;

public function test() {
    int p0 = 45;                                                            // 2
    var foo = 
        function (int z, int y) returns function () returns int {           // 3
            int p1 = 300;                                                   // 4
            int p2 = y;                                                     // 4
            var func = function () returns int {
                int p = 34;
                return p1 + p2 + p0 + z + y + p; // $paramMap$_4[p1] + $paramMap$_4[p2] + $paramMap$_2[p0] + $paramMap$_3[z] + $paramMap$_3[y]
            };
            return func;
        };
    
    var funcy = foo(3, 4);
}

public function main() {
    test();
}
