pragma solidity ^0.6.0;

contract Ownable {

  address public owner;

  event OwnershipTransferred(address previousOwner, address newOwner);

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "You are not owner");
    _;
  }
  /*
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0), "New Owner address is invalid");
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
  */
}