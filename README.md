# DegenToken

DegenToken is an ERC20 token designed for a gaming ecosystem. It allows users to mint new tokens, redeem tokens for various gaming items, and manage their item inventories. This README provides an overview of the contract functionalities and how to interact with it.

## Overview

The `DegenToken` contract is an implementation of the ERC20 token standard with additional features:
- **Minting**: The contract owner can mint new tokens.
- **Burning**: Users can burn tokens to redeem items.
- **Item Redemption**: Users can redeem tokens for specific gaming items.
- **Inventory Management**: Users can track their inventory of redeemed items.

## Contract Details

- **Token Name**: Degen Gaming Token
- **Token Symbol**: DGT
- **Initial Supply**: 1000 DGT

## Deployment

The contract is deployed with an initial supply of 1000 DGT tokens assigned to the contract owner's address.

## Functionalities

### Minting Tokens

The contract owner can mint new tokens and assign them to a specific address.

```solidity
function mint(address to, uint256 amount) public onlyOwner;
```
## Redeeming Tokens
Users can redeem tokens for gaming items. Each item has a specific token cost, and users need to have a sufficient token balance to redeem the desired quantity.

## Item Types and Costs:
Laptop: 10 DGT
Gaming Mouse: 5 DGT
Keyboard: 7 DGT
Headset: 6 DGT
External Hard Drive: 8 DGT
```solidity
function redeemTokens(ItemType itemType, uint quantity) public;
```
## Checking Token Balance
Users can check their DGT token balance.

```solidity
function checkBalance(address account) public view returns (uint256);
```
## Checking Item Quantity
Users can check the quantity of a specific item in their inventory.

```solidity
function getItemQuantity(address player, ItemType itemType) public view returns (uint);
```
## Events
The contract emits an ItemRedeemed event whenever a user redeems tokens for an item.

```solidity
event ItemRedeemed(address indexed player, ItemType itemType, uint quantity);
```
## Redeeming Tokens:

```solidity
DegenToken.redeemTokens(ItemType.Laptop, 1);
```
## Checking Balance
```solidity
uint256 balance = DegenToken.checkBalance(0xYourAddress);
```
## Checking Item Quantity:
```solidity
uint quantity = DegenToken.getItemQuantity(0xYourAddress, ItemType.Laptop);
```
## Installation
To install and use the DegenToken contract, you'll need to have Solidity and the OpenZeppelin Contracts library.

```bash
npm install @openzeppelin/contracts
```
## License
This project is licensed under the MIT License. See the LICENSE file for details.

### contract on snowtrace: 
https://snowtrace.io/address/0x8db97C7cEcE249c2b98bDC0226Cc4C2A57BF52FC
