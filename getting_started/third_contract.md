
# Before getting into the the third contract, let's discuss data storage and variable types

In Solidity, some types require a **data location** to specify where the data lives.


## Value Type Variables do not require an explicit data location (whether a function parameter or state variable)
- uint256
- bool
- address
- bytes32

## Reference-typed variables require explicit data storage declaration
- string
- bytes
- arrays
- structs
- mappings

The memory keyword explicitly tells solidity to temporarily store an actual copy of the data throughout the function's execution. (usually so that it can be used for setting a state variable onchain)

Notice how (in second_contract.sol) we only included the memory keyword when setting our function paramters, and not when we declared a string outside of the function!


```solidity
    string public name;

    function setName(string memory _newName) public {
        name = _newName;
    }
```
_newname is temporary stored into memory so that it can be used (in and during the lifetime of the function) to set the name state variable.

Again, memory is temporary data that **exists only during the function call**. Value types do not require explicity memory declaration, while reference types do.

## Three main data locations and keywords
- storage: **permanent** on-chain storage
- memory: **temporary** memory using to store data for reference variables during a function call
- calldata (**read-only external input** data for EXTERNAL function calls. worry about later!)


### State Variables are stored in storage by default because they live on chain!
No need for a copy throughout the function call because we aleady have the data for the state variables stored and handy!

Remember that these state variables are declared inside of the contract, but outside of functions!
```
contract my_contract {
    string public name; // no need for explicity memory declaration
    uint256 public favoriteNumber;
}

```

# Key Takeaways before Starting Contract 3:
- value types never need a data location
- reference types require a data location when they are in a function, but not if they are for a state vaariable
- state variables are stored in storage automatically


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

