import ballerina/io;

public function main() {
    final int i = 10;
    var fooObject = object {
        int j = i;

        fooType f = object {
            int j = i;
        }; 

        function name() returns int {
            return i;
        }
    };

    io:println(fooObject is fooType); 
}

type fooType object {
    int j;
};
