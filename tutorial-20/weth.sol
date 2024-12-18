// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20 {

    event Deposit(address indexed account, uint amount);

    event Withdraw(address indexed account, uint amount);

    constructor() ERC20 ("WETH", "WETH"){

    }   

    fallback() external payable {
        deposit();
    }

    receive() external payable {
        deposit();
     }

    function deposit() public payable{
        _mint(msg.sender, msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint _amount) external {
        _burn(msg.sender, _amount);
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);
    }

    function getBlance() external view returns(uint){
        return address(this).balance;
    }
}