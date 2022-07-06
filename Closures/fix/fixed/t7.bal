final int i = 100;

function testClosureVariableUsedInsideAttachedMethodBodyAndField() {
    final int i = 10;

    var inferredObj = object {

        function bar() returns int {
            return i;
        }
    };
}
