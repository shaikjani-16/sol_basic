//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedSize{
    uint[3] public numbers;
    
    function setNumbers(uint _num1,uint _num2,uint _num3) public{
        numbers[0]=_num1;
        numbers[1]=_num2;
        numbers[2]=_num3;
    }
    function getNumbers_index(uint index) public view returns (uint){
        require(index<=numbers.length,"out of bound");
        return numbers[index];
    }
    
}