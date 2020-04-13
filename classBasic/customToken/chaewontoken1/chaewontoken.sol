pragma solidity ^0.6;

contract chaewonToken {
    mapping (address => uint256) public balanceOf;
    string public name = "chaewon1121"; //Token의 이름
    string public symbol = "cw1121"; // Token의 이이름이름의 줄임
    
    constructor(uint256 initialSupply) public {
        balanceOf[msg.sender] = initialSupply;
    }
}