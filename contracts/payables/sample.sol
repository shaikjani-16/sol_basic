// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// allows functions and address to actually receive ether 

contract Payable{
    uint totalMoney;
    //function accepting ether to deposit
    function deposit(uint _amount) public payable{
        totalMoney+=_amount;
        //totalMoney+=msg.value;
    }
    // address to withdrawal the ether so we attach payable so we attach payable to it
    function withdrawal(address payable addr) public returns(string memory){
        payable(addr).transfer(totalMoney);
        totalMoney=0;
        return "Transfer sucessfull";
    }
}