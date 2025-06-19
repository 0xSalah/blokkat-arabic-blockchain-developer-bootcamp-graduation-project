// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.30;

import "./MyToken.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

interface IMyToken {
    function mint(address to, uint256 amount) external;
    function transferOwnership(address _newOwner) external;
}

contract isoProject is Ownable {
    IMyToken public mytoken;

    constructor(address tokenAdd) Ownable(msg.sender) {
        mytoken = IMyToken(tokenAdd);
    }

    //@dev The fund func is used to allow the user to fund the contract with ETH
    //in exchange for tokens
    function fund() external payable {
        require(msg.value > 0, "sent ETH to fund and get a token");
        uint256 amount = msg.value * 1000;
        mytoken.mint(msg.sender, amount);
    }

    //@dev The withdraw func allows the contract owner to withdraw the funds from
    //the contract to use them for their project
    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}
