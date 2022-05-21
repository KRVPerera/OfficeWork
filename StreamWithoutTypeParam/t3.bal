type Person record {
    string name;
    int age;
};

type Employee record {
    string name;
    string company;
};

function getPersonList() returns Person[] {
    Person[] personList = [];
    Person gima = {name: "Gima", age: 100};
    Person mohan = {name: "Mohan", age: 200};
    Person grainier = {name: "Grainier", age: 150};
    Person chiran = {name: "Chiran", age: 75};
    Person sinthuja = {name: "Sinthuja", age: 150};
    personList.push(gima);
    personList.push(mohan);
    personList.push(grainier);
    personList.push(chiran);
    personList.push(sinthuja);
    return personList;
}

function testBasicTypeStream() {
    Person[] personList = getPersonList();

    stream streamRef = personList.toStream();
    stream<Person> personStream = <stream<Person>>streamRef;

    stream<Employee> mappedEmpStream = personStream.'map(function(Person person) returns Employee {
        Employee e = {
            name: person.name,
            company: "WSO2"
        };
        return e;
    });
}
