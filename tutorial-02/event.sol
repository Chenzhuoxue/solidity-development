// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 通过事件打日志
contract Event {
    // 普通事件
    event normalLog(string eventCode, string eventData);
    // 索引事件，最多给三个参数创建事件
    event indexedLog(address indexed addr, string eventLog, string eventData);

    function logNormal() external {
        emit normalLog("eventCode", "eventData");
    }

    function logIndexedLog() external {
        emit indexedLog(msg.sender, "eventLog", "eventData");
    }

}