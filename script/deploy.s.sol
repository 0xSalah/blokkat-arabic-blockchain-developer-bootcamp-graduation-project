// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.30;

import "forge-std/Script.sol";
import "../src/MyToken.sol";
import "../src/ICO_Project.sol";

contract deployContract is Script {
    MyToken mytoken;
    isoProject myProject;

    function setUp() external {}

    function run() external {
        vm.startBroadcast();
        mytoken = new MyToken();
        myProject = new isoProject(address(mytoken));
        mytoken.transferOwnership(address(myProject));
        vm.stopBroadcast();
    }
}
