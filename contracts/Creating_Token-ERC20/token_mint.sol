// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreateToken {
    address public owner;
    mapping(address => uint) private balances;
    uint public supply = 0;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Unauthorized");
        _;
    }

    function createMint(uint _noOfTokens) public isOwner returns (string memory) {
        balances[owner] += _noOfTokens;
        supply += _noOfTokens;
        return "Successfully minted";
    }

    function balanceOf(address _addr) public view returns (uint) {
        return balances[_addr];
    }

    function mintTo(address payable _addr, uint _amount) public isOwner returns (string memory) {
        require(_amount <= balances[owner], "Not enough supply");
        balances[_addr] += _amount;
        balances[owner] -= _amount;
        return "Minted successfully";
    }

    function transfer(address _toAddress, uint _amount) public returns (string memory) {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        unchecked {
            balances[msg.sender] -= _amount;
            balances[_toAddress] += _amount;
        }
        return "Successfully transferred";
    }
}
