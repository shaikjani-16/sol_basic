//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract proxy{
    uint public num;
    address public implementation;
    constructor(address _implementation){
        implementation=_implementation;
    }
    fallback() external {
        (bool sucess,)=implementation.delegatecall(msg.data);
        require(sucess,"Delegation faliled");
    }
}
contract Implementationv1{
    uint public num;
    address public implementation;
    function setNum(uint _num) public{
        num=_num;
    }
    function  getNum() public view returns (uint){
        return num;
    }
}