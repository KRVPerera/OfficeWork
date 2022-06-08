
 // map<int>unique_obj1_oceMap = topMap;


function checkClosuresWithClientObjectConstrExprWithAnnots(int b1) {
    int i = 10; // %3
    // topMap[i] = 10;
    

    // topMap[obj1_closure_oceMap] = {};
    // topMap[obj1_closure_oceMap][i] = 10;
     // var obj2 = client object { 

    var obj1 = client object {
        int a2 = i;

        function init() {
            // paramMap
        }

        // map>anu
        remote function bar(int b2) returns int {
            // paramMap = {}
            // self[ocemap][i] ==> paramMap[i] 
            // 
            // return b2 +  paramMap[i] + paramMap[self][a2]
            return b2 + i + self.a2; // <- tempUniversalMap
            /// b2 +  paramMap[i] + paramMap[self][a2]
            // lamda <- tempUniversalMap
        }

        function MyFunc () returns int {  // link paramMap to topMap
            // paramMap = {}
            // self[ocemap][i] ==> paramMap[i] 
            int y = i; // paramMap[i] 
            i  = 3; // paramMap[i] = self[ocemap][i] = 3;
            function () returns int xx = () => i + self.a2 + y; // ==> paramMap_2["i"]
            // i ==> paramMap[self][ocemap][i]
            // i ==> paramMap[self][a2]
            // 
            return xx();
        }

        // 
    };

    int res = obj1->bar(10);
    // assertValueEquality(res, 400);
}