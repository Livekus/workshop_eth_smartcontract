
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BomToken {
   string name       = "BombToken" ;
   string symbole    = "BT";
   uint256 csupply    =   9000000;
   uint256 maxSupply   = 100000000;
   uint256 decimal  = 10;

   address owner;


   mapping(address => address ) public transaction;

   mapping(address => uint256 ) ledger;

   mapping(address => address ) public trust;

   constructor() {
         owner   = msg.sender ;
    } 

  
     modifier OnlyOwner{
        require(msg.sender == owner);_;
    }



    function getBalance() public view OnlyOwner returns(uint256)
    {
        return ledger[msg.sender];

    }


    function mint(uint256 _amount ,address targetAdress) public {
             require( _amount+csupply <= maxSupply , "error not enough supply");
             ledger[targetAdress] += _amount;
             csupply += _amount;
    }

    function burn(uint256 _amount) public {
        ledger[msg.sender] -= _amount;
             csupply -= _amount;
    }

    function approve (address _trusty) public {
        trust[msg.sender] = _trusty;
    }

    

    function tranfer (address _target, uint256 _amount ) public {
         require(ledger[msg.sender] > _amount);
         ledger[_target] += _amount;
         ledger[msg.sender] += _amount;
    
    }





   



}