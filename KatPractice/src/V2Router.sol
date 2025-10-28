pragma solidity ^0.8.20;


interface IUniswapV2Router02 {
 // add the function you need to call here
}



contract V2Router {

// address WBTC = ......;
// address USDC = .....;
 function swapWBTCForUSDC(uint256 amount) external {
   // add the logic for calling the v2 router here
   // anyone who calls it (having first approved the contract to spend their WBTC) should receive USDC back into their wallet.
 }
}
