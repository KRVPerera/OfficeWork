
public function main() {
    record {int|string|boolean a; int|boolean b;} r = {a: 1, b: true};
    record {int|string|boolean a; int|string b;} _ = r; // NO ERROR!

}
