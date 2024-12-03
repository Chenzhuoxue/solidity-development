// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 被调用的合约C
contract C {
    uint public num;
    address public sender;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
    }
}

// 发起调用的合约B
contract B {
    uint public num;
    address public sender;

    event log(string msgStr, bool success);

    // 通过call来调用C的setVars()函数，将改变合约C里的状态变量
    function callSetVars(address _addr, uint _num) external payable{
        // call setVars()
        (bool success, ) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        emit log("callSetVars", success);
    }

    // 通过delegatecall来调用C的setVars()函数，将改变合约B里的状态变量
    function delegatecallSetVars(address _addr, uint _num) external payable{
        // delegatecall setVars()
        (bool success, ) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        emit log("delegatecallSetVars", success);
    }
}