pragma solidity ^0.8.0;

import "v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract V2Router {

// address WBTC = ......;
// address USDC = .....;
   address WBTC = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;
   address USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
   IUniswapV2Router02 public router;

   constructor(address _router) {
        router = IUniswapV2Router02(_router);
    }

 function swapWBTCForUSDC(uint256 amountIn, uint256 amountOutMin) external {
   // add the logic for calling the v2 router here
   // anyone who calls it (having first approved the contract to spend their WBTC) should receive USDC back into their wallet.
     
     IERC20(WBTC).transferFrom(msg.sender, address(this), amountIn);
     IERC20(WBTC).approve(address(router), amountIn);

     address[] memory path = new address[](2);
     path[0] = WBTC;
     path[1] = USDC;
     router.swapExactTokensForTokens(amountIn, amountOutMin, path, msg.sender, block.timestamp);
 }
}
