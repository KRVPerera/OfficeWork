
public function main() {
    EvenNumberGenerator evenGen = new ();
    stream<int, error?> evenNumberStream = new (evenGen);
    stream newStreamA = getAnotherStreamA(evenNumberStream);
    stream newStreamB = getAnotherStreamB(evenNumberStream);
    stream<int, error?> str1 = <stream<int, error?>>newStreamA;
    stream<int, error?> str2 = <stream<int, error?>>newStreamB;
}

function getAnotherStreamA(stream a) returns stream<int, error?> {
    return <stream<int, error?>>a;
}

function getAnotherStreamB(stream a) returns stream {
    return a;
}

class EvenNumberGenerator {
    int i = 0;
    public isolated function next() returns record {|int value;|}|error? {
        self.i += 2;
        return {value: self.i};
    }
}
