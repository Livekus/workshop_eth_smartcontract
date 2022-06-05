// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public hellow = "Hello World";

    function update(string memory _word) public{
        hellow =  _word;
    }
}