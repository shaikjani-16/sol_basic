// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Person {
    struct Person_Data {
        string name;
        uint age;
        address addr;
    }

    Person_Data public person_sample;

    event PersonUpdated(string name, uint age, address indexed addr);

    function setPerson(string memory _name, uint _age, address _addr) public {
        Person_Data storage p = person_sample; // Use a storage reference for efficiency
        p.name = _name;
        p.age = _age;
        p.addr = _addr;

        emit PersonUpdated(_name, _age, _addr); // Emit an event
    }

    function getPerson() public view returns (string memory, uint, address) {
        return (person_sample.name, person_sample.age, person_sample.addr);
    }
}
