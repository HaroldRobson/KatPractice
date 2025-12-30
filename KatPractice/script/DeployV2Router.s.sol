// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {V2Router} from "../src/V2Router.sol";

contract DeployV2RouterScript is Script {
    V2Router public v2Router;

    function setUp() public {}

    function run() public {
        // Uniswap V2 Router addresses:
        // Mainnet: 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
        // Goerli: 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D (same)
        // Sepolia: 0xC532a74256D3Db42D0Bf7a0400fEFDbad7694008
        // You can also set this via environment variable: ROUTER_ADDRESS
        
        address routerAddress = vm.envOr("ROUTER_ADDRESS", address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D));
        
        vm.startBroadcast();

        v2Router = new V2Router(routerAddress);

        vm.stopBroadcast();
    }
}

