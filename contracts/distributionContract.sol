//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MainContract {
    address Owner;
    IERC20 Token;

    constructor(IERC20 _token) {
        Token = IERC20(_token);
    }

    //["0xc4Add62799dCE825Bc59D893af0c77F2df8C3412","0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db","0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB","0x617F2E2fD72FD9D5503197092aC168c91465E7f2","0x17F6AD8Ef982297579C203069C1DbfFE4348c372","0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678","0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7","0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC"]

    function calcPercentage(uint256 tokens, uint64 _percentage)
        public
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
            Token.transferFrom(msg.sender, _addresses[i], tokensPerAddress);
        }

        //Getting 30% tokens
        uint256 tokens30 = calcPercentage(tokens_amount, 30);
        //Now dividing 30% on 25%
        tokensPerAddress = tokens30 / addresses25;
        //Sendig Tokens to Second 25% addresses
        for (uint256 i = addresses25; i < addresses25 * 2; i++) {
            Token.transferFrom(msg.sender, _addresses[i], tokensPerAddress);
        }

        //Getting 20% tokens
        uint256 tokens20 = calcPercentage(tokens_amount, 20);
        //Now dividing 20% on 25%
        tokensPerAddress = tokens20 / addresses25;
        //Sendig Tokens to Third 25% addresses
        for (uint256 i = addresses25 * 2; i < addresses25 * 3; i++) {
            Token.transferFrom(msg.sender, _addresses[i], tokensPerAddress);
        }

        //Getting 10% tokens
        uint256 tokens10 = calcPercentage(tokens_amount, 10);
        //Now dividing 10% on 25%
        tokensPerAddress = tokens10 / addresses25;
        //Sendig Tokens to Fourth 25% addresses
        for (uint256 i = addresses25 * 3; i < addresses25 * 4; i++) {
            Token.transferFrom(msg.sender, _addresses[i], tokensPerAddress);
        }
    }
}
