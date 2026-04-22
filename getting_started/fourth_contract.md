# Contract 4
In this contract we teach what a mapping is, keeping the overal contract straight and to the point. One of the largest takeaways while learning this contract is how we can use a single contract to store state variables for multiple users.

We also briefly introduce conditionals.

## mapping 
A mapping is almost identicaly to a Python dictionary. What differs is that the data types for the keys and values must be declared at time of mapping creation. You can't have keys equal to just any dtypes! While maybe inconvinient, this makes dictionaries much more memory and computationally efficient.

```solidity
contract MyMappings {
    mapping(address => string) public addressNames;
    mapping(string => string) public nameAndNumber;

    //we would then go on to create getter and setter methods 
}
```


## fourth_contract.sol syntax

In the below, we instantiate the mapping state variable called favoriteNumbers. The keys will be of type address, and values of type uint256.

Notice how we do not use a constructor for our contract! There is no need to, as each individual user that will call the contract gets their own values set. Not really a single 'owner'!

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FavoriteNumbers {
    mapping(address => uint256) public favoriteNumbers;


}
```

We then add a function that will allow users of the contract to add their favoriteNumber to the favoriteNumbers state variable.

To refersh on some previous topics, we can observe how ANYONE can call this method and add their favorite number. The function is public, not just a view, and there are no require statements.

We make use of the msg object (which describes whoever is calling the contract and its methods) for setting the user's 'key'. All the caller has to pass into the function is their favorite number.

We assign the key via mapping_obj[key value] to the _favoriteNumber parameter passed in. Both the key and value gets added to the mapping state variable!

Think about the inherent restrictions that this contract might have. What if someone passed in a negative number?
- there'd be a function input error since negative numbers are not UNSIGNED integers!

```solidity
function setMyFavoriteNumber(uint256 _favoriteNumber) public {
    favoriteNumbers[msg.sender] = _favoriteNumber;
}
```

We then add a function that users can call in order to see what their favorite number is. The address passed in as the key is that of whoever called the contract function!

If whoever calls this functon (their address) has no mapped key/value pair, 0 will be returned by default.

```solidity
function getMyFavoriteNumber() public view returns (uint256) {
    return favoriteNumbers[msg.sender];
}
```

What if some people will be choosing 0? It might make sense to change the default value passed if the variable is not set. 

We make use of the fact that unmapped addresses return 0 by default. this is just how the mapping data type works.

Note how we MUST still return a uint256. Not a string, and not negative number. 

Here, we also briefly introduce if/else statements! They work almost identicaly to python except for the syntax. Instead of colons and tabs, you have brackets and parenthesis, similar to c or javascript. 


```solidity
function getMyFavoriteNumber_improved() public view returns (uint256) {
    if (favoriteNumbers[msg.sender] == 0) {
        return 999;
    } else {
        return favoriteNumbers[msg.sender];
    }
}
```

While the above is great, it sucks that we are still returning a number, and we already know a better way to stop function execution whne a condition is met!

```solidity
    function getMyFavoriteNumber_even_better() public view returns (uint256) {
        require(favoriteNumbers[msg.sender] != 0, "no favorite number set for the current address");
        return favoriteNumbers[msg.sender];
    }
```


Finally, we make a function where any address can be passed as input to get an address's favorite number (one address can now not just get their own favoriteNumber, but also any other address's favorite number!)

```solidity
function getFavoriteNumber(address _user) public view returns (uint256) {
    require(favoriteNumbers[_user] != 0, 'Address has not set a favorite number!');
    return favoriteNumbers[_user];
}
```

