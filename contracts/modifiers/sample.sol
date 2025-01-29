// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract modifiers{
    address public owner;
    constructor(){
        owner=0xd389CC66679a41607360A6015A0c4fC435Bc310a;
    }
    modifier isOwner(){
        require(msg.sender==owner,"unauthorized");
        _; // function will be executed after require

    }
    modifier isOwner1(){
        _; // function wiil be executed before require
        require(msg.sender==owner,"unauthorozed");
    }
        function test_modifier()  isOwner public  view  returns(address)   {
            return msg.sender;
        }
    

}
