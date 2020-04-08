pragma solidity ^0.6.0;

import "./SafeMath.sol";

contract Token{
    using SafeMath for uint256;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    constructor() public {
        _symbol = "AVOCA";
        _name = "Avocado";
        _decimals = 18;
        _totalSupply = 10000* (10 ** uint256(_decimals));
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0),msg.sender, _totalSupply);
    }
    mapping(address => uint) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    function name() public view returns (string memory) {
        return _name;
    }
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address account) external view returns (uint256){
        return _balances[account];
    }
    function transfer(address recipient, uint256 amount) external returns (bool){
        require(msg.sender != address(0));
        require(recipient != address(0));

        _balances[msg.sender] = _balances[msg.sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowances[owner][spender];
    }
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool){
        require(_from != address(0));
        require(_to != address(0));
        
        _balances[_from] = _balances[_from].sub(_value);
        _balances[_to] = _balances[_to].add(_value);

        emit Transfer(_from, _to, _value);

        _allowances[_from][msg.sender] = _allowances[_from][msg.sender].sub(_value);
        emit Approval(_from, msg.sender, _allowances[_from][msg.sender]);

        return true;
    }
    function approve(address spender, uint256 amount) external returns (bool){
        require(msg.sender != address(0));
        require(spender != address(0));

        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

}