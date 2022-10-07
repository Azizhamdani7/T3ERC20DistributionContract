//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DistributionContract {
    IERC20 Token;

    constructor(IERC20 _token) {
        Token = IERC20(_token);
    }

    function calcPercentage(uint256 tokens, uint256 _percentage)
        private
        pure
        returns (uint256)
    {
        uint256 result = (_percentage * tokens) / 100;
        return result;
    }

    function distribute(address[] memory _addresses, uint256 tokens_amount)
        public
    {
        //Getting total addresses length
        uint256 addressCount = _addresses.length;
        //Getting 25% addresses
        uint256 addresses25 = addressCount / 4;
        // uint addresses25= calcPercentage(addressCount, 25);
        //Getting  40% of tokens
        uint256 tokens40 = calcPercentage(tokens_amount, 40);
        //Not dividing 40% tokens on 25%
        uint256 tokensPerAddress = tokens40 / addresses25;
        //Sending Tokens to First 25 % addresses
        for (uint256 i = 0; i < addresses25; i++) {
            Token.transferFrom(msg.sender, _addresses[i], tokensPerAddress*10**18);
        }

        //Getting 30% tokens
        uint256 tokens30 = calcPercentage(tokens_amount, 30);
        //Now dividing 30% on 25%
        tokensPerAddress = tokens30 / addresses25;
        //Sendig Tokens to Second 25% addresses
        for (uint256 i = addresses25; i < addresses25 * 2; i++) {
            Token.transferFrom(msg.sender, _addresses[i], tokensPerAddress*10**18);
        }

        //Getting 20% tokens
        uint256 tokens20 = calcPercentage(tokens_amount, 20);
        //Now dividing 20% on 25%
        tokensPerAddress = tokens20 / addresses25;
        //Sendig Tokens to Third 25% addresses
        for (uint256 i = addresses25 * 2; i < addresses25 * 3; i++) {
            Token.transferFrom(msg.sender, _addresses[i], tokensPerAddress*10**18);
        }

        //Getting 10% tokens
        uint256 tokens10 = calcPercentage(tokens_amount, 10);
        //Now dividing 10% on 25%
        tokensPerAddress = tokens10 / addresses25;
        //Sendig Tokens to Fourth 25% addresses
        for (uint256 i = addresses25 * 3; i < addresses25 * 4; i++) {
            Token.transferFrom(msg.sender, _addresses[i], tokensPerAddress*10**18);
        }
    }
}
