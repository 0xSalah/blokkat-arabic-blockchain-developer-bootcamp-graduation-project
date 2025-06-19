// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.30;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
contract MyToken is ERC20, Ownable{
    

    //@dev This func mints 1M tokens of a currency like USDT for the user
    constructor() ERC20("MyUSDT","MY-USDT") Ownable(msg.sender){
    }

    function mint(address _to, uint _amount ) public onlyOwner{
        _mint(_to, _amount);
    }

}
