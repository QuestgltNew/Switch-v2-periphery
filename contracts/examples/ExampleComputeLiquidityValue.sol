pragma solidity =0.6.6;

import '../libraries/SwitchV2LiquidityMathLibrary.sol';

contract ExampleComputeLiquidityValue {
    using SafeMath for uint256;

    address public immutable factory;

    constructor(address factory_) public {
        factory = factory_;
    }

    // see SwitchV2LiquidityMathLibrary#getReservesAfterArbitrage
    function getReservesAfterArbitrage(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB
    ) external view returns (uint256 reserveA, uint256 reserveB) {
        return
            SwitchV2LiquidityMathLibrary.getReservesAfterArbitrage(
                factory,
                tokenA,
                tokenB,
                truePriceTokenA,
                truePriceTokenB
            );
    }

    // see SwitchV2LiquidityMathLibrary#getLiquidityValue
    function getLiquidityValue(
        address tokenA,
        address tokenB,
        uint256 liquidityAmount
    ) external view returns (uint256 tokenAAmount, uint256 tokenBAmount) {
        return SwitchV2LiquidityMathLibrary.getLiquidityValue(factory, tokenA, tokenB, liquidityAmount);
    }

    // see SwitchV2LiquidityMathLibrary#getLiquidityValueAfterArbitrageToPrice
    function getLiquidityValueAfterArbitrageToPrice(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB,
        uint256 liquidityAmount
    ) external view returns (uint256 tokenAAmount, uint256 tokenBAmount) {
        return
            SwitchV2LiquidityMathLibrary.getLiquidityValueAfterArbitrageToPrice(
                factory,
                tokenA,
                tokenB,
                truePriceTokenA,
                truePriceTokenB,
                liquidityAmount
            );
    }

    // test function to measure the gas cost of the above function
    function getGasCostOfGetLiquidityValueAfterArbitrageToPrice(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB,
        uint256 liquidityAmount
    ) external view returns (uint256) {
        uint256 gasBefore = gasleft();
        SwitchV2LiquidityMathLibrary.getLiquidityValueAfterArbitrageToPrice(
            factory,
            tokenA,
            tokenB,
            truePriceTokenA,
            truePriceTokenB,
            liquidityAmount
        );
        uint256 gasAfter = gasleft();
        return gasBefore - gasAfter;
    }
}
