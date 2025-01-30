//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
// If you want to use cross contract invocation (CCi) we need to first mention the 
// structure of functions that are present in the another contract using interfaces
// eternal modifiers is used by default be it public or external
interface IMessageInterface{
    function setMessage(string memory newMessage ) external;
    function getMessage() external view returns(string memory);
}

contract ParentContract{
    address private childContractAddress;

    constructor(address _contractAddress){
        childContractAddress=_contractAddress;
    }
    function setMessageFromOtherContract(string memory newMessage) public{
        IMessageInterface(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).setMessage(newMessage);
    }
    function getMessageFromOtherContract() public view returns(string memory){
        return IMessageInterface(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).getMessage();
    }
}
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4