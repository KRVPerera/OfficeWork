type ObjectName object {

    string name;
    function getName() returns string;
};

var obj = object {
    string name = "Alice" + " Bob";
    function getName(string  name) returns string {
        return "Hello";
    }
};
