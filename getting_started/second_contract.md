# The Second Contract
Our first contract walkthrough taught:
- contracts as blueprints
- state variables
- variable visibility
- compilation
- deploying to a network
- read-only interaction

We will now look at:
- functions
- parameters
- changing state
- view
- msg.sender
- constructor
- multiple state variables



## Explaining the syntax
Our contract will contain:

- 3 public state variables
- 1 constructor (that initializes the state variable values)
- 3 functions (2 write/tx and 1 call/read)


```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleProfile {
    //state variables
    address public owner;
    string public name;
    uint256 public favoriteNumber;

    //constructor
    constructor() {

    }

    //functions
    function setName() public {

    }

    function setFavoriteNumber() public {

    }

    function getSummary() public view returns () {

    }

}
```

### The state variables
```solidity
//dtype visibility name
address public owner;
string public name;
uint public favoriteNumber;
```
#### Variable Data Types



##### Standard/Foundational Numerical Data Types
- uint256 (unsigned integer, 256 bytes by default in solidity)
- floats, signed ints, what else?


##### Non-Numeric data types
string
- similar to python string? array of characters?

##### Datatypes unique to solidity
The **address** datatype:



#### Variable visibility
- if it is public, it is given a getter() function that can be called on the deployed instance of the contract!

#### variable Scope
- talk more about laater


### Building the constructor
When we deploy a contract, we are not just creating a contract, but also initializing its state via the **constructor()** method. The constructor is **only run once**, and this occurs at the time of deployment.
- this is how our initialized state variables can start out with a value!

```solidity
constructor(string memory _name, uint256 _favoriteNumber) {
    owner = msg.sender;
    name = _name;
    favoriteNumber = _favoriteNumber;
}
```

#### msg.sender is whoever is calling the contract
- during deployment, this is the deployer! (you)
- after the contract instance is live on chain, msg.sender is whoever calls a function (interacts with the contract methods)

When we set name and favoriteNumber, we are initializing the state for when the contract is first created.


### Creating our own contract methods/functions
In contract one, we saw that some functions are already made for us (getter methods for public variables)


The two functions below are simply SETTER functions for our public state variables (that were initialized at time of deployment thanks to the constructor)


```solidity
//accepts a parameter (as a string)called _newName. this temporary variable is used as part of the function to set the value of the contract/onchain name variable
function setName(string memory _newName) public {
    name = _newName;
}

function setFavoriteNumber(uint256 _newFavoriteNumber) public {
    favoriteNumber = _newFavoriteNumber;
}
```

The public keyword is what makes our function callable externally (from outside the contract, such as via the abi)

The two functions are both **transaction functions** because they modify blockchain state, and therefore they would cost gas.

The function below **DOES NOT** modify state, and is read only and off-chain. A state changing tx (that costs gas) is not needed.

```solidity
//notice how the specified dtype returned matches our owner, name, and favoriteNumber state variables!
function getSummary() public view returns (address, string memory, uint256) {
    return (owner, name, favoriteNumber);
}
```


# Compile and Deploy
1. compile the code
2. put inputs for the constructor (setting the initial variable states), and deploy the contract

We see that our deployed contract ends up with 6 total functions: 2 that are state changing and 4 that are simple getters


# Deploy it again!
we that this new instance has a new address! each deployment is a completely separate contract instance. interacting with the first deployment (and visa versa) won't affect the second deployment
- different deployment address
- different state 
- same code

# Switch Ethereum accounts and then call a function
- when this new account calls a function on a deployed contract, it works, and updates the contract (msg.sender changes, but owner/deployer address does not!)
- we never restricted this! anyone can interact with any part of the contract even if they aren't the original owner/msg.sender in original deployment


- all of the functions are public!


# Explaining access control
We can use the require() method to perform checks before anything else in a function is run! In the below we enforce that the only person who can call the contract setter methods is the original owner/deployer of the contract. If someone who is not the owner tries to use the contract, it will fail and give them the requirement message that they are not the valid owner of the contract. The function quits before doing anything.

```solidity
    function setName(string memory _newName) public {
        require(msg.sender == owner, "Not owner, so not allowed")
        name = _newName;
    }
```

** note that you must deploy the contract again!**

Deploy the contract and then change to another etehereum account. Try calling the setName() function and notice the error now thanks to our require() check!

**The transaction has been reverted to the initial state.
Reason provided by the contract: "Not owner, Not allowed!".**






# Setter functions and why _ is used in variable names
## Setter functions modify/update blockchain state based on parameters passed in
- setName()
- setFavoriteNumber()

## Solidity programmers by convention add a '_' in front of parameter variables
This allows us to easily distinguish between temporary variables and what's actually the state variable (and on chain)

```solidity
    stateVariable = _temporaryParamVariable
```
