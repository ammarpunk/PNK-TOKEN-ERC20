// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract Punk is ERC20, ERC20Burnable, ERC20Capped{
    address payable public owner;
    uint256 public reward;
    constructor(uint256 cap , uint256 r) ERC20("Punk", "PNK") ERC20Capped(cap * 10 ** decimals()) {
        owner = payable(msg.sender);
        _mint(msg.sender, 700000 * 10 ** decimals());
        reward = r * 0 ** decimals();
    }
    function _mint(address account, uint256 amount) internal virtual override(ERC20Capped, ERC20) {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super._mint(account, amount);
    }
    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        if(from != address(0) && to != block.coinbase && block.coinbase != address(0)) {
            _mintMinerReward();
        }
        super._beforeTokenTransfer(from, to, value);
    }
    function _mintMinerReward() internal {
        _mint(block.coinbase, reward);
    }

    
    function burn(uint256 amount) public virtual override(ERC20Burnable) {
        super._burn(msg.sender, amount);
    }  
    /*function destroy() public onlyOwner {
        selfdestruct(owner);
    }*/
    
    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
}  