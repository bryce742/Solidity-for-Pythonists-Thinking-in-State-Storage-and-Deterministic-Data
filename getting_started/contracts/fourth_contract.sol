// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FavoriteNumbers {
    // instantiate the favoriteNumbers variable, which is of type 'mapping' (think python dictionary key/value pairs)
    mapping(address => uint256) public favoriteNumbers;

    function setMyFavoriteNumber(uint256 _favoriteNumber) public {
        favoriteNumbers[msg.sender] = _favoriteNumber;
    }

    function getMyFavoriteNumber() public view returns (uint256) {
        return favoriteNumbers[msg.sender]; //if msg.sender isn't in favoriteNumbers, it automatically returns 0 by default
    }

    function getMyFavoriteNumber_improved() public view returns (uint256) {
        if (favoriteNumbers[msg.sender] == 0) {
            return 999;
        } else {
            return favoriteNumbers[msg.sender];
        }
    }

    function getMyFavoriteNumber_even_better() public view returns (uint256) {
        require(favoriteNumbers[msg.sender] != 0, "no favorite number set for the current address");
        return favoriteNumbers[msg.sender];
    }

    function getFavoriteNumber(address _user) public view returns (uint256) {
        require(favoriteNumbers[_user] != 0, 'Address has not set a favorite number!');
        return favoriteNumbers[_user];
    }
}