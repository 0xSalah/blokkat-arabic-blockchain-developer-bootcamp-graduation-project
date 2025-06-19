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


# Security best practices 

### 1- Using Specific Compiler Pragma
```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.30;
```

### 2- Proper Use of Require
-src/ICO_Project.sol-
```solidity
function fund() external payable {
        require(msg.value > 0, "sent ETH to fund and get a token");
        uint256 amount = msg.value * 1000;
        mytoken.mint(msg.sender, amount);
    }
```

# important links & addresses
address ICO_Project.sol : 0x31A5268A60A2390262aAE6a1229cd1B62a3f8E58
address MyToken.sol :
0xB208731308F55342C1d4e1084020EEe7B35BCEfa



# How to Run Tests

To run the tests for this project using [Foundry](https://book.getfoundry.sh/), follow these steps:

###  Requirements

- Make sure you have Foundry installed. If not, run:
  ```bash
  curl -L https://foundry.paradigm.xyz | bash
  foundryup
  ```
  ### Running the Tests
  ```bash
  forge test
  ```


# How to Run the Program

This project includes deployment scripts using Foundry. You can run them on a local testnet like Anvil.

###  Run a Local Node (Anvil)

Start a local testnet:

```bash
anvil
```
In a separate terminal, deploy the contracts using
```bash
 forge script script/deploy.s.sol --rpc-url http://localhost:8545 --private-key <YOUR_PRIVATE_KEY> --broadcast
```



# env file :
### on contract file :
```.env
PRIVATE_KEY= YOUR PRIVATE KEY
RPC_URL= inter RPC url
```
```.env
### on frontend file:
NEXT_PUBLIC_PROJECT_ID= your project id
```
