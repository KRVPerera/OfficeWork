import ballerina/io;
// import ballerina/lang.__internal;

public function main() { // 1
    // int i = 10;
    // blockMap[i] = 10; // 2
    var foo = object { // 3

        // blockMap
        // functionMap_78
        // 6 --> blockMap_56 
        function getI(int x, int y) returns function () returns int { // 4
            int p1 = 200;
            // functionMap_78[x] . // 5
            // $blockMap_56[p1] . //  // 6 --> blockMap_56

            var func = function () returns int {
                //paramMap_4[p1]  
                return p1 + x;
                //paramMap_6[p1]  + paramMap_5[x] 
            } 

            return func;
        }
    };

    var funcy = foo.getI(23);
    io:println(funcy());
}
