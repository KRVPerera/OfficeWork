final int i = 100;
final int k = 200;

function testClosureVariableUsedInsideAttachedMethodBodyAndField() {
    final int i = 10;
    object {
        int x;
        function bar(int b) returns int;

    } bOceVariable = object {
        int x = i;

        function bar(int b) returns int {
            return b + i;
        }
    };

    var lambda = bOceVariable.bar;
    int y = lambda(45);

    var inferredObj = object {
        int x = i;

        function bar(int b) returns int {
            return b + i;
        }
    };

    lambda = inferredObj.bar;
    lamda = FP (inferredObj){
        inferredObj.bar;
    }
    y = lambda(45);

}
