// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./vehicle.sol";

contract car is vehicle{
    
    constructor(string memory _brand, uint _wheels) vehicle(_brand){
        
    }
    function description() public pure override returns(string memory){
        return "this is car";
    }
}
