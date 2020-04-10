pragma solidity 0.5.12;

import "./Context.sol";
import "./ERC20.sol";
import "./ERC20Detailed.sol";
import "./ERC20Burnable.sol"; 


contract JeongminToken is Context, ERC20,ERC20Burnable, ERC20Detailed {
    
    address owner; 
    bool private issued = false;

    constructor() public ERC20Detailed("JeongminToken", "Jeongmin", 18) {
        owner = _msgSender(); 
        _mint(_msgSender(), 10000 * (10 ** uint256(decimals())));
    }

}