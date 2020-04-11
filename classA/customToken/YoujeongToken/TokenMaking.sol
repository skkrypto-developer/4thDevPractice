
pragma solidity ^0.6.0;

import "./Context.sol";
import "./ERC20.sol";
import "./ERC20Detailed.sol";
import "./ERC20Burnable.sol";

contract TokenMaking is Context, ERC20, ERC20Detailed, ERC20Burnable {

    constructor() public ERC20Detailed("TEST","TTT",20){
        _mint(_msgSender(), 10 * (10 ** uint256(decimals())));
    
    }

}