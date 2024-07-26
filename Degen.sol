// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
   
    enum ItemType { Laptop, GamingMouse, Keyboard, Headset, ExternalHardDrive }
    
    event ItemRedeemed(address indexed player, ItemType itemType, uint quantity);
    
    mapping(address => mapping(ItemType => uint)) public itemInventory;

    constructor() ERC20("Degen Gaming Token", "DGT") Ownable(msg.sender) {
        _mint(msg.sender, 1000 * 10 ** decimals()); // Initial supply for liquidity
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    
    function redeemTokens(ItemType itemType, uint quantity, uint tokenCost) public {
        uint totalCost = tokenCost * quantity;
        require(balanceOf(msg.sender) >= totalCost, "Insufficient balance to redeem items");
        _burn(msg.sender, totalCost);       
        itemInventory[msg.sender][itemType] += quantity;
        emit ItemRedeemed(msg.sender, itemType, quantity);
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
   
    function getItemQuantity(address player, ItemType itemType) public view returns (uint) {
        return itemInventory[player][itemType];
    }
}
