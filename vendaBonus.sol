// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract VendaBonus {
        
    string public nomeVendedor;
    uint256 public fatorBonus = 10;

    constructor(string memory nomeVendendo) {
        nomeVendedor = nomeVendendo;        
    }

    function calcular(uint256 valorVenda) public view returns (uint256) {
        return (valorVenda * (fatorBonus / 100)) + valorVenda;
    }

}
