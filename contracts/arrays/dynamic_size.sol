// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract dynamic_size{
        uint[] public numbers;
        function addNumber(uint _num) public {
                numbers.push(_num);
        }
        function getNumberCount() public view returns(uint){
            return numbers.length;
        }
                
}