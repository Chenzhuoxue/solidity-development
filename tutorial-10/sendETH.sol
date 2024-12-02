// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ReceiveETH {
    // 收到eth事件，记录amount和gas
    event Log(string msgStr, uint amount, uint gas);

    // receive方法，接收eth时被触发
    receive() external payable{
        emit Log("receive", 143, 123);
    }

    // fooback方法，接收eth时被触发
    fallback() external payable {
        emit Log("fallback", 133, 123);
    }
    
    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
}

contract SendETH {
    
    event sendLog(address indexed from, address indexed to, string msgStr, uint amount);

    // 初始化ETH
    constructor() payable {

    }

    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    // 测试send 发送ETH
    function testSend(address payable _to, uint amount) external payable {
        bool success = _to.send(amount);
        emit sendLog(msg.sender, _to, success ? "send: success" : "send: failed", amount);
    }
    // 测试transfer 发送ETH
    function testTransfer(address payable _to, uint256 amount) external payable{
        _to.transfer(amount);
        emit sendLog(msg.sender, _to,  "send: success", amount);

    }
     // 测试call 发送ETH
    function testCall(address payable _to, uint256 amount) external payable{
        (bool success,) = _to.call{value: amount}("");
        emit sendLog(msg.sender, _to, success ? "call: success" : "call: failed", amount);
    }


}