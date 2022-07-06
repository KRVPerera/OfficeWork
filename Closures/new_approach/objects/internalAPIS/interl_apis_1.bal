import ballerina/io;
import ballerina/lang.__internal;

public function main() {
    final int i = 10;
    int k = 200;
    map<any> mm = {};
    mm["i"] = 10;
    mm["k"] = 200;

    var foo = object {
        int j = i;

        function getI() returns int {
            int p = 300;
            map<any> getMapValue = <map<any>>__internal:getBlockClosureMap(self);
            return <int>getMapValue["i"] + <int>getMapValue["k"] + p;
        }
    };
    __internal:setBlockClosureMap(foo, mm); // setBlockClosureMap
    __internal:setParamClosureMap(foo, mm, 1); // setBlockClosureMap
    __internal:printClosureMaps(foo);

    map<any|error> getMapValue = __internal:getBlockClosureMap(foo);
    printMapValues(getMapValue);

    io:println(foo.getI());

}

function printMapValues(map<any|error> getMapValue) {
    io:println("###### EXT printMapValues START ######");
    foreach var item in getMapValue {
        io:println(item);
    }
    io:println("####### EXT printMapValues END ######");
}

type Foo object {
    function foo() returns int;
};
