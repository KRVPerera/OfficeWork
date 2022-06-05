type Employee record {
    int id;
    string name;
};

function errorFunction() {
    table<Employee> t1 = table [
        {id: 1, name: "Jo"},
        {id: 1}, // @error missing non-defaultable required field 'name'
        {id: 1, name: true} // @error expected value of type string for the 'name' field
    ];
}
