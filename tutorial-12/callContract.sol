// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract OtherContract {

    uint256 private _x = 0; 
    event Log(uint amount, uint gas);
    
    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable{
        _x = x;
        // 如果转入ETH，则释放Log事件
        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    // 读取x
    function getX() external view returns(uint x){
        x = _x;
    }
}

contract CallContract{

    // 传入合约地址调用
    function callSetX(address _Address, uint256 x) external{
        OtherContract(_Address).setX(x);
    }

    // 传入合约变量调用
    function callGetX(OtherContract _Address) external view returns(uint x){
        x = _Address.getX();
    }

    // 定义合约变量调用
    function callGetX2(address _Address) external view returns(uint x){
        OtherContract oc = OtherContract(_Address);
        x = oc.getX();
    }

    // 设置数值，并发送以太
    function setXTransferETH(address otherContract, uint256 x) payable external{
        OtherContract(otherContract).setX{value: msg.value}(x);
    }
}