// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Called {
    uint public number;
    event NumberChanged(address _from, uint newNumber);

    function changeNumber(uint newNumber) public {
        number = newNumber;
        emit NumberChanged(msg.sender, newNumber);
    }
}


contract Caller {
    address public called;
    uint public number;
    address public owner;

    constructor(address _called) {
        called = _called;
        owner = msg.sender;
    }

    function delegateChangeNumber(uint newNumber) public {
        (bool success, ) = called.delegatecall(
            abi.encodeWithSignature("changeNumber(uint256)", newNumber)
        );
        
        require(success, "DelegateCall failed");
    }

    function callChangeNumber(uint newNumber) public {
        (bool success, ) = called.call(
            abi.encodeWithSignature("changeNumber(uint256)", newNumber)
        );

        require(success, "Call failed");
    }

    function callChangeAddress(address newContract) public {
        called = newContract;
    }
}   
