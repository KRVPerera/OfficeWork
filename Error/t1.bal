import ballerina/io;

public function main() {
    error:Cloneable x = 4;
    error e1 = error("reason 1", message = "My Detail");
    map<error:Cloneable> m1 = e1.detail();

    io:println(x);  // 4
    io:println(m1); // {"message":"My Detail"}
}
