# ICO Project
A crowdfunding ICO project that enables users to purchase tokens to support the development of our project


## Directory Structure

- `lib/`: Contains external dependencies installed via Foundry.
- `script/deploy.s.sol`: A Solidity script to deploy the smart contracts.
- `src/ICO_Project.sol`: The main contract that manages the ICO logic.
- `src/MyToken.sol`: The custom ERC20 token that users can purchase during the ICO.
- `test/testICO_Project.t.sol`: Unit tests for the ICO contract written using Foundry's test framework.


# design patterns

### 1- Inheritance and Interfaces
-src/ICO_Project.sol-
```solidity
import "./MyToken.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

interface IMyToken {
    function mint(address to, uint256 amount) external;
    function transferOwnership(address _newOwner) external;
}
```

### 2- Access Control Design Patterns 
-src/ICO_Project.sol-
```solidity
contract isoProject is Ownable {
    IMyToken public mytoken;

    constructor(address tokenAdd) Ownable(msg.sender) {
        mytoken = IMyToken(tokenAdd);
    }
```
