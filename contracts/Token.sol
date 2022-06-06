// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ERC20.sol";
contract Woas is ERC20{
    constructor() ERC20("mohamad","MOH",100000 * 1e5,5){
        _blances[_msgSender()]=100000 * 1e5;
    }
}