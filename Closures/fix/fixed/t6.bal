final int i = 100;
final int k = 200;

function testClosureVariableUsedInsideAttachedMethodBodyAndField() {
    final int i = 10;

    var inferredObj = object {

        function bar(int b) returns int {
            return b + i;
        }
    };
}
