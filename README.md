# KatPractice
Learn Solidity


### Task 1)

 - Write a contract which exchanges WBTC to USDC for the person who calls the function, going through a uniswap v2 pool via their router
 - Write a test which forks ethereum mainnet, funds a wallet with Eth (for gas) and WBTC, and then calls the contract from the wallet.
 - UniswapV2 router: 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
 - you will call swapExactTokensForTokens in the v2 router. Code: https://github.com/Uniswap/v2-periphery/blob/master/contracts/UniswapV2Router02.sol
 - docs: https://docs.uniswap.org/contracts/v2/reference/smart-contracts/router-02
 - your contract: src/V2Router.sol
 - test: test/VsRouterTest.t.sol
