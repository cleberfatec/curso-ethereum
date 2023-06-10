// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract VendaBonus {
    string public nomeVendedor;
    uint256 public fatorBonus;

    constructor(string memory nomeVendendo, uint256 _fatorBonus) {
        nomeVendedor = nomeVendendo;        
        fatorBonus = _fatorBonus;
    }

    function calcular(uint256 valorVenda) public view returns (uint256) {
        return (valorVenda * fatorBonus / 100) + valorVenda;
    }
}
//0xC592e3f031B40567C0C7e743EC28Ab0aFe04cBac