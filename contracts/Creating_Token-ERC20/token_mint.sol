// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreateToken {
    address public owner;
    mapping(address => uint) public balances;
    uint public supply = 0;
    mapping(address=>mapping(address=>uint)) public allowances;
    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Unauthorized");
        _;
    }

    function createMint(uint _noOfTokens) public isOwner returns (string memory) {
        balances[owner] += _noOfTokens;
        supply += _noOfTokens;
        return "Successfully minted";
    }

    function balanceOf(address _addr) public view returns (uint) {
        return balances[_addr];
    }

    function mintTo(address payable _addr, uint _amount) public isOwner returns (string memory) {
        require(_amount <= balances[owner], "Not enough supply");
        balances[_addr] += _amount;
        balances[owner] -= _amount;
        return "Minted successfully";
    }

    function transfer(address _toAddress, uint _amount) public returns (string memory) {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        unchecked {
            balances[msg.sender] -= _amount;
            balances[_toAddress] += _amount;
        }
        return "Successfully transferred";
    }

    // allowances
    // allows the token holder to grant permission to another address to use the certain amount of tokens
    event TransferFrom(address indexed _from, address indexed _to,uint256 _value);
    event allowanceEvent(address _owner, address _spender,uint256 _amount);
    function approve(address _spender, uint256 _value) public returns (bool success){
        allowances[msg.sender][_spender]=_value;
        return success;        
    }
    // remaining allowance 
    function allowance(address _owner, address _spender) public  returns (uint256 remaining){
        emit allowanceEvent(_owner,_spender,allowances[_owner][_spender]);
        return allowances[_owner][_spender];
    }
    // transfer from allowanced token
    // i want to send the allowanced token to another address;
    // from the issuer (original owner) to another address via me.
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(allowances[_from][msg.sender]>=_value,"Insufficient Allowence");
        uint balance = balances[_from];
        require(balance>=_value,"Insufficient balance from allowance");
        balances[_from]-=_value;
        balances[_to]+=_value;
        allowances[_from][msg.sender]-=_value;
        emit TransferFrom(_from, _to, _value);
        return success;
        }






}
