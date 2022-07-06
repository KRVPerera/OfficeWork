// import ballerina/io;

public function Function_L1() returns int {
    int i = 10; // $map$block$_2[i] = 10
    var foo_L2 = function() returns int {
        return i;
    };

    return foo_L2();
}


public function main() {
    int i = 20;
    int main_i = Function_L1();
    // io:println(main_i);
}
