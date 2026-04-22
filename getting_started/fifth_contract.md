# Introducing structs as a way to immitate real world data

| Concept | Python dict | Python class | C struct | Solidity struct |
|---------|-------------|--------------|----------|-----------------|
| Groups multiple pieces of data together | yes | yes | yes | yes |
| Creates a custom data type | no | yes | yes | yes |
| Mainly stores data | yes | can, but also behavior | yes | yes |
| Can contain methods/functions inside itself | no | yes | no | no |
| Good for modeling real-world entities | yes | yes | yes | yes |
| Commonly used for on-chain storage | no | no | no | yes |


A struct is a custom data type that groups multiple standard variable dtypes together. Structs allow programmers to abstract on the simple/inherent data types in solidity, in order to create data structure that mimic the real world.

These structs are still storing state, just multiple state variables at once that are connected together.

Think of what the 'rows' in a phonebook database might look like. Each row/instance has a name, number, address etc. We can connect these simple strings/int variables together to create an abstracted 'phonebook' data type that contains all the information for each person/instance in that phonebook!

It is very similar to a list of dictionaries and/or classes, but important to know that structs do not contain methods.

```python
class User:
    def __init__(self, name, favorite_number):
        self.name = name
        self.favorite_number = favorite_numbe

```

```solidity
struct User {
    string name;
    uint256 phoneNumber;
    string homeAddress;
}
```


**Structs are not objects with behavior** (as you might see in a class), they are *just* data containers. Logic for contracts will always exist in the contract's functions -- not its state variables (structs are just more-abstracted ways to store state)


# Mapping vs Structs
Previously in contract 4 we introduced a mapping, where one address variable can point/be mapped to another variable for their favorite number. However, each address only mapped to ONE value.
```solidity
mapping(address => uint256) public favoriteNumbers;
```

With structs, we can now have each address associated with >1 values -- such as for their own user accounts on a potential app!
```solidity
struct UserAccount {
    string name;
    string phoneNumber;
    uint age;
}
```
one user --> {name, phone number, evm wallet address}


## Combing mapping and struct together!
While we have this UserAccount struct, it doesn't really do much right now, as it basically just defines single state variables and doesn't really save a collection of information. Sure someone could create a UserAccount, but we don't having a mapping system for keeping the multiple accounts in a single mapped data structure!

```solidity
struct UserAccount {
    string name;
    string phoneNumber;
    uint age;
}

mapping(address => UserAccount) public userAccounts;
```
Now, each address maps to a UserAccount struct, and not just a single int like we had earlier!!

# Instantiating structs


# Accessing data in a struct



# Contract 5 Syntax: Creating a basic user profile
Each address will be mapped to a struct that contains that address's/user's details. 






