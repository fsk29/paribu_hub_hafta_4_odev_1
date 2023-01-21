// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract FeeCollector { // 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8
    address public owner;
    uint public balance;
    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value; // balance = balance + msg.value;

    }

    function withdraw(uint amount, address payable destAddr) public{
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");
        
        destAddr.transfer(amount);
        balance -= amount;

    }
}