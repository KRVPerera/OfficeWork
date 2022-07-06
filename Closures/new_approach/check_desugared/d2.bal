public function func(int param) returns int {
    final int i = 10;
    var fooObject = object {
        int j = i + param;

        function name() returns int {
            return i + param;
        }
    };

    return fooObject.name();
}

public function main() {
    int z = func(30);
}
