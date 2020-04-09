pragma solidity ^0.6.0;

import "./SafeMath.sol";
//import "./Ownable.sol";

contract myToken /*is Ownable*/ {
    using SafeMath for uint256;

    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    address private _admin;

    constructor () public {
        _name = "PLEASE";
        _symbol = "TT";
        _decimals = 18;
        _totalSupply = 10000 * (10 ** uint256(_decimals));
        _balances[msg.sender] = _totalSupply;
        _admin = msg.sender;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    modifier onlyAdmin() {
        require(msg.sender == _admin, "You are not owner");
        _;
    }

    function name() public view returns (string memory) {
        return _name;
    }
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    function admin() public view returns (address) {
        return _admin;
    }
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }
    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowances[owner][spender];
    }

    function transfer(address recipient, uint256 amount) external returns (bool) {
        require(recipient != address(0), "recipient is invalid");
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(from != address(0), "error");
        require(to != address(0), "error");

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);

        _allowances[from][msg.sender] = _allowances[from][msg.sender].sub(value);

        emit Transfer(from, to, value);
        emit Approval(from, msg.sender, _allowances[from][msg.sender]);

        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        require(msg.sender != address(0), "error");
        require(spender != address(0), "error");

        _allowances[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);

        return true;
    }

    function mint(address account, uint256 amount) external onlyAdmin returns (bool) {
        require(account != address(0), "recipient is invalid");
        _mint(account, amount);
        return true;
    }

    function burn(address account, uint256 amount) external /*onlyOwner*/ returns (bool) {
        require(account != address(0), "account is invalid");
        _burn(account, amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        _balances[sender] = _balances[sender].sub(amount, "transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);

        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint256 amount) internal {
         _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);

        emit Transfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount) internal {
        _balances[account] = _balances[account].sub(amount, "burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);

        emit Transfer(account, address(0), amount);
    }
}

/* origin file

pragma solidity ^0.6.0;

import "./SafeMath.sol";
import "./Ownable.sol";

contract myToken is Ownable {
    using SafeMath for uint256;

    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    address private _admin;

    constructor () public {
        _name = "PLEASE";
        _symbol = "TTTT";
        _decimals = 18;
        _totalSupply = 10000 * (10 ** uint256(_decimals));
        _balances[msg.sender] = _totalSupply;
        _admin = msg.sender;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    mapping (address => uint256) public _balances;
    event Transfer(address indexed from, address indexed to, uint256 value);

    modifier onlyAdmin() {
        require(msg.sender == _admin, "You are not owner");
        _;
    }

    function name() public view returns (string memory) {
        return _name;
    }
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    function admin() public view returns (address) {
        return _admin;
    }
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) external returns (bool) {
        require(recipient != address(0), "recipient is invalid");
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function mint(address account, uint256 amount) external onlyAdmin returns (bool) {
        require(account != address(0), "recipient is invalid");
        _mint(account, amount);
        return true;
    }

    function burn(address account, uint256 amount) external onlyOwner returns (bool) {
        require(account != address(0), "account is invalid");
        _burn(account, amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        _balances[sender] = _balances[sender].sub(amount, "transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);

        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint256 amount) internal {
         _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);

        emit Transfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount) internal {
        _balances[account] = _balances[account].sub(amount, "burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);

        emit Transfer(account, address(0), amount);
    }
}

*/