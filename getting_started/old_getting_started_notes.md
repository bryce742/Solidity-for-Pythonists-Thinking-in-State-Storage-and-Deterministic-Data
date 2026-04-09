

# Getting Started
The basic workflow for working with .sol files is:
1. create/open and edit a .sol file
2. compile it (choosing the compiler to use)
3. choose an environment to deploy and run transactions in
4. deploy the contract
5. interact with the deployed instance of the contract 
- these interactions can be either state-changing or read-only


## How do we run solidity files?
- unlike Python, solidity code cannot be run directly from a file

Smart Contracts (solidity scripts) must be:
1. Compiled
2. Deployed to a blockchain environment (chain and devnet/testnet/mainnet)

Live/Deployed Instances of contracts can then be...

3. Interacted with through transactions/calls
A deployed contract is a **stateful program/API living on-chain**, NOT just an object
A deployed contract has:
- **state variables** that store the contract data/state/static data
- **functions** that can be called to perform an action
- **calls** which act like read-only interactions/functions
- **transactions**, which are a type of state-changing interaction


### We need a way to compile the solidity code, deploy contracts (scripts), test functions, and observe state changes
- compile: turn the .sol file (containing solidity code) to bytecode + ABI
- deploy: create an instance of a contract (this instance has an address)
- interact: use the ABI/UI to call functions (that can be read or write)

## The **ABI** is the standard interface for interacting with contracts from outside the chain and between contracts (explain)

## A note on the compiler and environments:
- compiler environment != deployment environment
- the compiler version must be compatible with the contract's **pragma**
- when learning, do not use the experimental 'nightly builds' compiler (use the latest deployed/stable version instead
- the deployed environment is what decides where contracts get deployed (such as Remix VM, injected wallet/provider/etc.

#### Remix is a browser-based Solidity development environment that provides:
- a solidity compiler
- a simulated blockchain (for ...)
- a UI for interacting with and calling contracts (via tx?)
- instant feedback/testing

# Remix IDE Tutorial
1. Open Remix: **https://remix.ethereum.org**

## Remix Side Panel/Options
### File Explorer
- contains the files and folders in the current workspace/working environmnet
- this is where you do ...
#### By default, Remix Projects ususally start with: (explain slightly)
./contracts
./scripts
./tests
.prettierrc.json
README.txt
remix.config.json
remix.config1.json


### Search Feature
- allows you to search for text in files?


### Solidity Compiler
- turns the .sol files into bytecode (compiles them)
#### You can specify which compiler you want to use and how it works
- explain how the compiler versions and names for them work
- include nighly builds??
- Auto compile?
- hide warnings?

You basically end up selecting the .sol file to compile, and can either just comile to the executable contract, or compile & run the executable all in one go

##### Advanced Configurations


### Deploy and Run Transactions
#### Environment
- compile environment vs deployment environmnet?

##### Choosing a Virtual Machine or Environment
__
- Browser Extension
- Remix VM
- VM Fork
- Dev
- Base
- WalletConnect
- Custom -- External HTTP Provider

___
- Osaka
- Prague
- Cancun
- Shanghai
- Paris
- London
- Berlin

##### You start out with a bunch of testnet accounts on Ethereum!
- add/import wallets
- explain more and how this is used

#### Deploy (does so based on the environment?)
- select a (compiled?) contract
- value for wei
- Gas limit
- Deploy button (Creates a tx and interacts with the contract or deploys it? what is the difference?


#### Deployed Contracts
- once contracts are deployed, they can be interacted with (via transactions?)



#### Transactions recorder
- explain


### Git



### Plugin Manager



## The Workspace



## Top Panels



## Other Stuff to know about remix

