// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Pure{
    // cannot read and modify blockchain data
    // can use local variables and inputs
    // can call another pure function
        uint public total=1;
    function sum(uint _num1, uint _num2) public pure returns(uint){
            return(_num1+_num2);           
    }

}