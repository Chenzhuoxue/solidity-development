// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract A {

    event log(string str);

    function foo() public virtual returns(string memory){
        emit log("A");
        return "A";
    }

    function bar() public returns(string memory) {
        emit log("A");
        return "A";
    }

}

contract B is A {

    function foo() public virtual override  returns(string memory){
        emit log("B");
        return "B";
    }

    function barB() external returns(string memory) {
        emit log("B");
        return "B";
    }

}

contract C is A {

    function foo() public virtual override  returns(string memory){
        emit log("C");
        return "C";
    }

    function barC() external returns(string memory) {
        emit log("C");
        return "C";
    }

}

contract D is A {

    function foo() public virtual override(A) returns(string memory){
        emit log("D");
        return "D";
    }

    function barD() external returns(string memory) {
        emit log("D");
        super.bar();
        return "D";
    }

}

contract E is C, B {

    function foo() public virtual override(C,B) returns(string memory){
        emit log("EEEE");
        super.foo();
        return "E";
    }

    function barD() external returns(string memory) {
        emit log("E");
        A.bar();
        return "E";
    }

}