// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
// 1.0 require: ⽤于输⼊验证和访问控制
// 2.0 revert: 适⽤于多层if语句中的条件检查。2.0 
// 3.0 assert: ⽤于检查始终应为真的条件。
// 4.0 自定义错误
contract MyError {

    error ParamError(address sender, string errorMsg);

    function testRequire(uint i) external pure {
        require(i > 10, "require i > 10");
    }

    function testRevert(uint i) external pure {
        if (i < 10) {
            revert("revert error, because i < 10");
        }
    }

    function testAssert(uint i) external pure {
        bool flag = i > 10;
        assert(flag);
    }   

    function testMyError(uint i) external view {
        if (i < 20) {
            revert ParamError(msg.sender, "require i < 20");
        }
    }

}