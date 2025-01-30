//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract CreateToken{
    address public owner;
    mapping(address=>uint) balances;
    uint public supply =0;
    constructor(){
        owner=msg.sender;
    }

    modifier isOWner(){
        require(msg.sender==owner,"Unauthorized");
        _;
    }

    function createMint(uint _noOfTokens) public isOWner  returns (string memory){
        balances[owner]=_noOfTokens;
        supply+=_noOfTokens;
        return "Sucessfully minted";
    }
    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }
    function mintTo(address payable _addr,uint _amount) public isOWner returns(string memory){
        balances[_addr]=_amount;        
        balances[owner]= supply-_amount;
        supply=supply-_amount;
        return "Minted To";
    }
    function transfer(address payable _toAddress,uint _amount) public returns (string memory){
        require(balances[msg.sender]>=_amount,"Insufficient balance");
        balances[msg.sender]= balances[msg.sender]-_amount;
        balances[_toAddress]+=_amount;
        return "Sucessfully transfered";
    }





}