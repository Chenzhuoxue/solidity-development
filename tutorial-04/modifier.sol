// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FuncModifier {
    uint public count;

    constructor () {
        count = 0;
    }

    modifier paramCheck(uint i) {
        require(i < 10, "require i < 10");
        _;
        
    }

    modifier countCheck() {
        _;
        require(count < 100, "require count < 100");
    }

    function increase(uint i) external paramCheck(i) countCheck {
        count += i;
    }
}