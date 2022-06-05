// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicSolidity {
    // Global Variable 
    uint256 global = 0 ;

    //Local i
    //Iron Man Profile
    string public name  = "Tony Strark"  ;
    uint256 public age   =  48;
    bool   public  isMale  =  true;

    uint256 public balance;
    string[]  public carreer  = ["playboy","engineer","hero"]; 

    address  private wallet;

    string[]  public girl;

    address public owner;

    mapping(string => uint256) public mileOfCar;
    mapping(string => bool) public isCar;
    mapping(string => uint256) public carSpeed;

    modifier OnlyOwner{
        require(msg.sender == owner);_;
    }

    mapping(address => uint256 ) public txWithdrow;


    constructor( uint256 _balance, address _wallet){
        owner = msg.sender;
        balance = _balance;
        wallet  = _wallet;
    }

    function tinder(string memory _girl) public {
        girl.push(_girl);
    }
    //only owener
    function getWallet() public view OnlyOwner returns(address){
                return wallet;
    }

    function addCar(string memory _car , uint256 miles ,uint256 speed) public {
        require(isCar[_car] == false,"Tony already has this car");
        mileOfCar[_car] = miles;
        carSpeed[_car]  =speed;
        isCar[_car] = true;
    }

    function getNumber(uint256 _i) public view returns(uint256){
        uint256 local  = _i;
        uint256 result = global + local;
        return result;

    }

    function plusResult() public view returns(uint256){
        return global +1;
    }

    function tranfer(uint256 _withdrow ,address _otheraddress) public  returns(uint256) {
        //tony tranfer to somebody 
        //must return current balance of Tony
        //input shu=ould gave _amount and _to

        // Condition 
        // 1. have 2 parameter there are _amount and _to 
        // 3. require amount < balance[optinal]

        require (balance > _withdrow , "not enough monney");
        balance  -=  _withdrow;
        txWithdrow[_otheraddress]  = _withdrow;
        

        return balance;

    }

    function fasterCar(string memory _car1 , string memory _car2) public view returns(string memory){
        // get 2car and return which one faster
        //1. must have to parameters that are car1 and car 2
        //2 use map
        //3 if else 
        if(carSpeed[_car1] < carSpeed[_car2]){
            return _car2;
        }else if (carSpeed[_car1] > carSpeed[_car2]){
            return _car1;
        }else{
            return "no" ;
        }


    }    

    function isVIPSender(address target) public  returns (bool){
        bool isVip = false;
        if(msg.sender ==target){
            isVip == true;
        }
        return isVip;
    }

    // function isVIP() public view returns (bool){
    //      // 1. use modifier
    //     // 2. return string "This one is VIP"
    //     // 3. use 2nd mock address

    //     return true;
    // }

    // function showName(bool _i) public view returns(string memory){
    //     if(_i == true){
    //         return "welcome";
    //     }else{
    //         return "Get out";
    //     }
    // }



}