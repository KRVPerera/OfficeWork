import ballerina/io;

const UniqueRecordId = "UniqueRecordId";

public type AnydataConsumerRecord record {|
    UniqueRecordId _internalId = UniqueRecordId;
    anydata key?;
    int timestamp?;
|};

public type PersonConsumerRecord record {|
    *AnydataConsumerRecord;
    byte[] key?;
    int timestamp;
|};

public function main() {
    PersonConsumerRecord pp = {timestamp: 0};
    io:println(pp);
}
