// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract FeeColletor {
    address public owner;
    uint256 public walletBalance;

    constructor(){
        owner = msg.sender;
    }

    receive() payable external {
        walletBalance += msg.value;    
    }

    function withDraw(uint amount, address payable destAddr) external {
        require(owner == msg.sender, "Function called by someone else.");
        require(amount <= walletBalance, "Insufficient funds");

        destAddr.transfer(amount);
        walletBalance -= amount;
    }
}