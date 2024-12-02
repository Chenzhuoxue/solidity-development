// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface ICouter {

    function count() external view returns (uint);
    function increase() external;
    
}

contract Counter is ICouter {

    uint public cnt;

    constructor() {
        cnt = 0;
    }

    function count() external view override  returns (uint) {
        return cnt;
    }

    function increase() external override {
        cnt += 1;
    }
}

contract MyContract {

    function increaseCounter(address counter) external {
        ICouter(counter).increase();
    }

    function getCount(address counter) external view returns(uint){
        return ICouter(counter).count();
    }

}