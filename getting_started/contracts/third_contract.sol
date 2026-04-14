// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FavoriteNumbers {
    // state variables
    address public owner;
    string public groupName;
    mapping(address => uint256) public favoriteNumbers;

    // constructor
    constructor(string memory _groupName) {
        owner = msg.sender;
        groupName = _groupName;
    }

    //functions
    //uint256 is just a value type, no memory
    function setMyFavoriteNumber(uint256 _favoriteNumber) public {
        require(_favoriteNumber > 0, "Number must be > 0");
        favoriteNumbers[msg.sender] = _favoriteNumber;
        //doesn't return anything, just sets key/value pair in the favoriteNumbers dictionary that is stored on chain
    }

    //_newGroupName is a reference type so needs explicit memory
    function setGroupName(string memory _newGroupName) public {
        require(msg.sender == owner, "Only the owner/deployer of this contract can set the groupName");
        groupName = _newGroupName;
        //also just a setter function
    }

    function getMyFavoriteNumber() public view returns (uint256) {
        return favoriteNumbers[msg.sender];
    }

    //address is just a value type, no memory
    function getFavoriteNumber(address _user) public view returns (uint256) {
        return favoriteNumbers[_user];
    }

    function getSummary(address _user) public view returns (string memory, uint256, address) {
        return(groupName, favoriteNumbers[_user], owner);
    }


}