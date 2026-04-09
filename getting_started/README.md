# Getting Started with Remix IDE

## The Basic Workflow
1. Create/open a .sol file
2. Compile it
3. Choose a deployment environment
4. Deploy the contract
5. Interact with the deployed contract


## Opening remix for the first time
### The workspace contains project files
It is where we create contracts (write .sol files and scripts) and organize files.
### Typical starting workspace  
contracts/  
scripts/  
tests/  

## Writing our first line of solidity code
- at the top of all .sol files, make sure to state which compiler to use! we do this by calling the pragma solidity command, passing in the compiler to use (as a pattern/regex)
- in the solidity compiler tab, you see this drop down of the latest versions! use the highest one in the drop down that is not a nightly version

It looks like the latest non-nightly named version is 0.8.35

```
pragma solidity 0.8.35 # exactly uses this version
```
0.8.35
│ │  └── patch
│ └──── minor
└────── major

####  We can instruct to use a pattern of availible versions
Using a certain version or newer with ^  
```
pragma solidity ^0.8.30; # use 0.8.30 or newer that doesn't break compatibility
```
- 0.8.30 is allowed
- 0.8.31 is allowed 
...

Using a range of versions
```
pragma solidity >=0.8.0 <0.9.0; # uses any version 0.8 patch
```

# Our first solidity file
in the file explorer tab...
1. create a new blank workspace
2. create a file called first_contract.sol (ignore other files for now)
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VersionTest {
    uint public x;
}

```
## This solidity file contains instructions for a contract (think class). This contract stores a state variable (of type uint and public) named x

3. Compiling the .sol file