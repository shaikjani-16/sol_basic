// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract View_example{
    //view
    //can read data from the blockchain, local variables
    //cannot modify data 
    //can call another view or pure functions
    uint8 public a=1;
    uint8 public b=2;
    uint8 public total=a+b;
    function sum() public view returns(uint16){
            return (a+b);
            //not work
        // total = total+1;
        // return (total);

            
    }

}