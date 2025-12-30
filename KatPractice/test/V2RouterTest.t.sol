pragma solidity ^0.8.0;
import {Test} from "forge-std/Test.sol";
import {V2Router} from "../src/V2Router.sol";

interface IERC20 {
  function balanceOf(address account) external view returns (uint256);// for checking our USDC balance after transaction
  function approve(address spender, uint256 amount) external returns (bool);
}

contract V2RouterTest is Test {
  address user;
  IERC20 IUSDC;
  IERC20 IWBTC;
  uint256 mainnetFork;
  V2Router ourContract;

  function setUp() public {
  mainnetFork = vm.createFork("wss://ethereum-rpc.publicnode.com"); 
  vm.selectFork(mainnetFork);
  user = vm.createWallet(uint256(keccak256(bytes("meow")))).addr; // create a wallet with "salt" as meow
  ourContract = new V2Router(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

  // address WBTC = ...; // find this out on mainnet
  address USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
  address WBTC = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;

  IUSDC = IERC20(USDC);
  IWBTC = IERC20(WBTC);
  deal(WBTC, user, 10 * 1e8); // transfer user WBTC for testing in our mainnet fork. 
  //Find out why this^^ is "deal" but for ETH we use vm.deal()
  vm.deal(user, 10 ether); // for gas
  }

  function test_V2Router() public {
    uint256 originalBalance = IUSDC.balanceOf(user);
    uint256 amountToSwap = 10000;
    uint256 amountOutMin = 10;
    vm.startPrank(user);
    IWBTC.approve(address(ourContract), amountToSwap);
    // there is a function you need to call here before you can call our contract - what is it? 
    ourContract.swapWBTCForUSDC(amountToSwap, amountOutMin); // call our function
    vm.stopPrank();
    require(IUSDC.balanceOf(user) > originalBalance, "USDC balance did not change");
  
  }
}
