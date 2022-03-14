// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../MiniBank.sol";

// required for expect revert and other cheats
interface Vm {
    // to assert returned contract errors
    function expectRevert(bytes calldata) external;

    // to change user interacting with the contract
    function prank(address) external;
}

contract MiniBankTest is DSTest {
    MiniBank minibank;
    // required for expect revert and other cheats
    // HEVM_ADDRESS is 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    Vm vm = Vm(HEVM_ADDRESS);

    function setUp() public {
        minibank = new MiniBank();
    }

    function testReturnsOpenedAccounts() public {
        assertEq(0, minibank.accountsOpened());
    }

    function testUserOpensAcount() public {
        minibank.openAccount();
        assertEq(1, minibank.accountsOpened());
    }

    function testMultipleUsersOpenAccount() public {
        minibank.openAccount();
        // injects change of user
        vm.prank(address(1));
        minibank.openAccount();
        vm.prank(address(2));
        minibank.openAccount();

        assertEq(3, minibank.accountsOpened());
    }

    // Test pass as method fails, but we can not assert why
    // function testFailOpenTwoAccountsSameUser() public {
    //     minibank.openAccount();
    //     minibank.openAccount();
    // }

    function testCannotOpenTwoAccountsSameUser() public {
        minibank.openAccount();
        // injects in
        vm.expectRevert("MiniBank: User has an account already!");
        minibank.openAccount();
    }

    function testAllowUsersDepositEth() public {
        minibank.openAccount();
        minibank.deposit{value: 1 ether}();
        assertEq(1 ether, minibank.checkBalance());
    }

    function testAllowUserCloseAndUpdateAccCounter() public {
        minibank.openAccount();
        // changes users
        vm.prank(address(1));
        minibank.openAccount();
        assertEq(2, minibank.accountsOpened());
        minibank.closeAccount();
        assertEq(1, minibank.accountsOpened());
    }

    function testCannotWithdrawWithoutAccount() public {
        vm.expectRevert("MiniBank: User does not have an account");
        minibank.withdraw(1 ether);
    }
}
