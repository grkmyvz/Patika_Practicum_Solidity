// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {

    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender; // When the contract is created, we assign the creator address to the owner.
    }

    receive() payable external {
        balance += msg.value; // When a money is sent to the contract, we add this amount to the balance.
    }

    function withdraw(uint256 amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can witddraw"); // Check if the person making the transaction is the person creating the contract
        require(amount <= balance, "Unsufficient funds"); // Is the amount you want to withdraw available in the contract?

        // NOTE : In the video, the change in the contract has been added after the transfer process.
        //       However, for security, first the changes in the contract are made and then the transfer operations are carried out.

        balance -= amount; // Take this amount out of balance.
        destAddr.transfer(amount); // If the require s are ok. Send the specified amount to destAddr.
    }
}