import ballerina/io;

public function main() {
    final int i = 10;
    // map<int> closureMap = {};
    // closureMap["i"] = 10;

    // getClosureMap
    var fooObject = object {
        int j = internalMap[];

        // getClosureMap
        int k = foo();


    };

    io:println(fooObject.j); 
}

type fooType object {
    int j;
};
