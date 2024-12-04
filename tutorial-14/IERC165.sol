// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

/**
 * ERC165标准接口, 详见 *
 * 合约可以声明支持的接口，供其他合约检查
 *
 */
interface IERC165 {
    /**
     * @dev 如果合约实现了查询的`interfaceId`，则返回true
     *
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}