// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import {A} from './inheritance.sol';

library StringUtil {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    function toHexString(uint256 value) public pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    function toHexString(uint256 value, uint256 length) public pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}

contract TestLibrary {
    using StringUtil for uint256;

    function testHex(uint256 value) external pure returns(string memory) {
        return StringUtil.toHexString(value);
    }

    function testUsing(uint256 value) external pure returns(string memory) {
        return value.toHexString();
    }

    function testA() external returns(string memory) {
        A a = new A();
        return a.foo();
    }

}