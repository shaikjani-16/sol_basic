// SPDX-License-Identifier: MIT
// events are used to log information on ythe blockchain
// logs can be seen by everyone either onchain or outside
// event emit logs


pragma solidity ^0.8.0;
contract _sample{
        event Thanks(string  name,address addr);

        function transfer(string memory _name) public{
            emit Thanks(_name,msg.sender);

        }
}
