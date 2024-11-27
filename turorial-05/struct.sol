// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract TodoList {
    struct Todo {
        string todoMsg;
        bool completed;
    }

    Todo[] public todoList;

    function addItem(string memory todoMsg) external {
          Todo memory item = Todo({todoMsg:todoMsg, completed:false});
          todoList.push(item);
    }

    function completeItem(uint index) external {
        todoList[index].completed = true;
    }
}