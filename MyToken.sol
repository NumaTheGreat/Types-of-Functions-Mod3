// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken {
string public coinName = "Manucoin";
string public coinSymbol = "MNC";
uint public coinSupply = 0;

mapping(address => uint) public coinBalances;

function mintCoins(address to, uint amount) public {
	coinSupply += amount;
	coinBalances[to] += amount;
}

function burnCoins(address from, uint amount) public {
	require(coinBalances[from] >= amount, "Insufficient balance to burn");
	coinSupply -= amount;
	coinBalances[from] -= amount;
}

function transferCoins(address from, address recipient, uint amount) public {
	require(coinBalances[from] >= amount, "Insufficient balance to transfer");
	coinBalances[from] -= amount;
	coinBalances[recipient] += amount;
	coinSupply -= amount;
}
}
