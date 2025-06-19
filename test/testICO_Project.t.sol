// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.30;
import "forge-std/Test.sol";
import "../src/MyToken.sol";
import "../src/ICO_Project.sol";

contract testICO_Project is Test{
MyToken mytoken;
isoProject myProject;
address owner = vm.addr(1);
address user = vm.addr(2);

function setUp() public {
    vm.deal(user, 10 ether);
    vm.startPrank(owner);
    mytoken = new MyToken();
    myProject = new isoProject(address(mytoken));
    mytoken.transferOwnership(address(myProject));
    vm.stopPrank();
}


//@dev The func tests the transfer of ownership of the token contract from 
// the owner to the contract
function testTransferOwnerShip() public view{
    assertEq(mytoken.owner(), address(myProject), "Error");
}

//@dev The func ensuers that the user cannot fund donate with zero value
function testMsgValueBiggerThanZero () public {
    vm.startPrank(user);
    vm.expectRevert();
    myProject.fund{value : 0}();
    vm.stopPrank();
}

//@dev The fun verifies that tokens are correctly minted to the user 
// after making a payment
function testAmount() public {
    vm.startPrank(user);
    myProject.fund{value : 1 ether}();
    vm.stopPrank();
    uint balance = mytoken.balanceOf(user);
    assertEq(balance,1000 ether);
}

//@dev the func that ensures the balance is transferred to the owner
//after withdrawal
function testWithdraw() public {
    uint OwnerbalanceBefore = owner.balance;
    vm.prank(user);
    myProject.fund{value : 1 ether}();

    vm.startPrank(owner);
    myProject.withdraw();
    uint OwnerbalanceAfter = owner.balance;

    assertEq(OwnerbalanceBefore + 1 ether, OwnerbalanceAfter);
}

//@dev The func that prevents the user from withdrawing the balance
function testWithdrawFromUser() public {
    vm.startPrank(user);
    myProject.fund{value : 1 ether}();
    vm.expectRevert();
    myProject.withdraw();}

fallback() external payable{}
receive() external payable{}
}