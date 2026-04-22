# Key Takeaways before Starting Contract 3:
- value types never need a data location
- reference types require a data location when they are in a function, but not if they are for a state variable
- state variables are stored in storage automatically
- public variable can be accessed from within and outside of the contract
- private variables can only be accessed from within the contract



# third_contract.sol
In this third contract, we will introduce:
- mapping
- require
- using msg.sender as a key
- view vs state-changing functions

## Key features of this contract:
- the contract has an **owner**
- the conract has a **groupName**
- only the owner can change the group name
- different addresses can interact with it to store their favorite numbers



```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract FavoriteNumbers {
    //state variables
    address public owner;
    string public groupName;
    mapping (address => uint256) public favoriteNumbers;

    //constructor


    //functions
}

```

### mapping (key_type => value_type) allows us to create a dictionary-like data structure that contains key/value pairs
```solidity
// favoriteNumbers is a 'dictionary' where the keys are an ethereum address and the values for those keys are a uint256 (for their favorite number)
mapping (address => uint256) public favoriteNumbers;

//setting a key/value pair
favoriteNumbers[address var] = 3

//accessing a key/value pair

```

