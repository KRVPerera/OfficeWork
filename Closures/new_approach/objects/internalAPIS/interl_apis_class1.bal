import ballerina/io;
import ballerina/lang.__internal;

class An1 {
    int j;

    function init() {
        self.j = 0;
    }

    function myInit() {
        map<any> getMapValue = <map<any>>__internal:getBlockClosureMap(self);
        self.j = <int>getMapValue["i"]; 
    }

    function getI() returns int {
        int p = 300;
        map<any> getMapValue = <map<any>>__internal:getBlockClosureMap(self);
        // 10 + 200 + 300 + 10 - 520
        return <int>getMapValue["i"] + <int>getMapValue["k"] + p + self.j;
    }
}

public function main() {
    final int i = 10;
    int k = 200;
    map<any> mm = {};
    mm["i"] = 10;
    mm["k"] = 200;

    var foo = new An1();
    __internal:setBlockClosureMap(foo, mm); // setBlockClosureMap
    foo.myInit();
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
