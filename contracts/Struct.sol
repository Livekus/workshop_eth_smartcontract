// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitkuberStruct {
    struct Bitkuber {
            string name;
            uint256 id;
            bool active;
    }
    string name;
    string age;
    string gender;
    uint256 asset;
    address wallet;

    Bitkuber effy = Bitkuber("Nuttakit",222,true);
    Bitkuber tent = Bitkuber("Tent", 18 ,true);

    function effyStatus() public view returns(bool){
        return effy.active;
    }

    function fireEffy() public {
        effy.active = false;
    }

}