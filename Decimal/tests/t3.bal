import ballerina/lang.'decimal as decimals;

public function main() {
    testRunnerTestRoundToFractionDigits();
    testRunnerTestRoundToZeroWithCast();
    testRoundWithNamedArguments();
}

type RoundFullDataPoint [decimal, int, decimal];

function testRunnerTestRoundToFractionDigits() {

    RoundFullDataPoint[] data = [
        [-504023030303030303030.303567, 3, -504023030303030303030.304],
        [-50402.303567, 8, -50402.303567],
        [3.303567, 0, 3],
        [3234.5, 0, 3234],
        [3234.303567, 0, 3234],

        [3234.503567, 0, 3235],
        [3233.503567, 0, 3234],
        [-3234.303567, 0, -3234],
        [-3234.5, 0, -3234],
        [3.303567, -1, 0],

        [3234.303567, -2, 3.2E+3],
        [3234.303567, -10, 0],
        [3234.303567, 7, 3234.303567],
        [3234.303567, 10, 3234.303567],
        [5.5555, 4, 5.5555],

        [5.5555, 3, 5.556],
        [5.5555, 2, 5.56],
        [5.56, 1, 5.6],
        [5.55, -1, 1E+1],
        [5.55, -200, 0],

        [5.55, 2147483647, 5.55],
        [5.55, -2147483648, 0],
        [5.5E-2, 3, 0.055],
        [5.52156E2, 3, 552.156],
        [5.521561234452654235E2, 15, 552.156123445265424]
    ];

    foreach RoundFullDataPoint dataPoint in data {
        testRoundToFractionDigits(dataPoint[0], dataPoint[1], dataPoint[2]);
    }
}

function testRoundToFractionDigits(decimal x, int fractionDigits, decimal actual) {
    assertEquality(decimals:round(x, fractionDigits), actual);
}

function testRoundWithNamedArguments() {
    decimal x = decimals:round(5.55, fractionDigits = 1);
    decimal y = decimals:round(x = 5.55);
    decimal z = decimals:round(x = 5.55, fractionDigits = 1);
    assertEquality(x.toBalString(), "5.6d");
    assertEquality(y.toBalString(), "6d");
    assertEquality(z.toBalString(), "5.6d");
}

function testRunnerTestRoundToZeroWithCast() {
    decimal[] data = [
        -50402.303567,
        3.303567,
        3234.5,
        3234.303567,
        -3234.303567,
        -3234.5,
        3.303567,
        3234.303567,
        5.5555,
        5.56,
        5.55,
        504023030303031.5035
    ];

    foreach decimal decimalNumber in data {
        testRoundToZeroWithCast(decimalNumber);
    }
}

function testRoundToZeroWithCast(decimal arg) {
    int casted = <int>arg;
    decimal rounded = arg.round(0);
    string castedStr = casted.toBalString() + "d"; // hack to make a decimal string
    string roundedStr = rounded.toBalString();
    assertEquality(castedStr, roundedStr);
}


function assertEquality(any|error expected, any|error actual) {
    if expected is anydata && actual is anydata && expected == actual {
        return;
    }

    if expected === actual {
        return;
    }

    string expectedValAsString = expected is error ? expected.toString() : expected.toString();
    string actualValAsString = actual is error ? actual.toString() : actual.toString();
    panic error("expected '" + expectedValAsString + "', found '" + actualValAsString + "'");
}
