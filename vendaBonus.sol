// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract VendaBonus {
    
    
    uint256 public constant FATOR_BONUS = 10;

    function calcular(uint256 valorVenda) public pure returns (uint256) {
        return (valorVenda * (FATOR_BONUS / 100)) + valorVenda;
    }

}