// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract MiniBank {
    struct Account {
        uint256 balance;
        bool isOpen;
    }
    // address[] accounts;
    mapping(address => Account) private accounts;
    uint256 nAccounts;

    constructor() {
        nAccounts = 0;
    }

    modifier userHasAccount() {
        require(
            accounts[msg.sender].isOpen,
            "MiniBank: User does not have an account"
        );
        _;
    }

    function openAccount() external payable {
        require(
            !accounts[msg.sender].isOpen,
            "MiniBank: User has an account already!"
        );
        accounts[msg.sender].isOpen = true;
        nAccounts += 1;
        if (msg.value > 0) {
            accounts[msg.sender].balance = msg.value;
        }
    }

    function deposit() external payable userHasAccount {
        require(msg.value > 0, "MiniBank: You have to send ETH to deposit!");
        accounts[msg.sender].balance += msg.value;
    }

    function withdraw(uint256 _amount) external userHasAccount {
        require(
            _amount >= accounts[msg.sender].balance,
            "MiniBank: You can not withdraw more than your balance!"
        );

        accounts[msg.sender].balance -= _amount;

        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "MiniBank: Error withdrawing, try again");
    }

    function checkBalance() external view userHasAccount returns (uint256) {
        return accounts[msg.sender].balance;
    }

    function closeAccount() external userHasAccount {
        require(
            accounts[msg.sender].balance == 0,
            "MiniBank: Your account balance must be 0. Withdraw your funds first!"
        );
        accounts[msg.sender].isOpen = false;
        nAccounts -= 1;
    }

    function accountsOpened() public view returns (uint256) {
        return nAccounts;
    }
}
