// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Context.sol";
import "./IERC20.sol";
import "./Safemath.sol";
import "./Ownable.sol";
contract ERC20 is Context,IERC20,Ownable{
    using SafeMath for uint256;

    mapping (address => uint256) _blances;
    mapping (address => mapping(address => uint256)) _allowance;
    string _name;
    string _symbol;
    uint _decimals;
    uint _totalsuply;
    constructor(string memory name0,string memory symbol0,uint256 decimals0,uint256 totalsuply0){
        name0=_name;
        symbol0=_symbol;
        decimals0=_decimals;
        totalsuply0=_totalsuply;

    }
    function name() public virtual view returns(string memory){
        return _name;
    }
    function sumbol() public virtual view returns (string memory){
        return _symbol;
    }
    function totalSupply() public virtual override view returns (uint256){
        return _totalsuply;
    }
    function decimals() public virtual view returns(uint256){
        return _decimals;
    }
    function balanceOf(address account) public virtual override view returns (uint256){
        return _blances[account];
    }
    function _transfer(address from,address to,uint256 amount) internal virtual{
        require(from != address(0),"from will not zero address");
          require(to != address(0),"to will not zero address");
          require(_blances[from]>=amount,"from must be bigger than amount");
          _blances[from]=_blances[from].sub(amount);
          _blances[to]=_blances[to].add(amount);
          emit Transfer(from,to,amount);


    }
    function _approve(address owner0,address spender,uint256 amount)internal virtual{
        require(owner0 != address(0),"owner0 will not zero address");
          require(spender != address(0),"spender will not zero address"); 
          _allowance[owner0][spender]=amount;
    }
     function transfer(address to, uint256 amount) public virtual override returns (bool){
         address from=_msgSender();
         _transfer(from,to,amount);
         return true;
     }
     function allowance(address owner, address spender) public virtual override view returns (uint256){
         return _allowance[owner][spender];
     }
     function approve(address spender, uint256 amount) public virtual override returns (bool){
         address owner1=_msgSender();
         _approve( owner1, spender,amount);
         return true;
     }
      function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool){
        address spender=_msgSender();
        require(amount<=_allowance[from][spender],"cant be use");
        _allowance[from][spender]=_allowance[from][spender].sub(amount);
        _transfer(from,to,amount);
        return true;

    }
}