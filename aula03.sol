// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

//0xE86eAEd3dAa1A831102445d187c3409de92da1Bb

contract Aluguel {
    string private locador;
    string private locatario;
    uint256[36] private valorAluguel;

    constructor(string memory _locador, string memory _locatario, uint256 _valorAluguel) {
        locador = _locador;
        locatario = _locatario;
        for (uint256 i = 0; i < 36; i++) {
            valorAluguel[i] = _valorAluguel;
        }    
    }

    function getValorAluguelPorMes(uint256 _mes) public view returns (uint256) {
        require(_mes > 0 && _mes <= 36, "Mes invalido");
        return valorAluguel[_mes - 1];
    }

    function getLocadorLocatario() public view returns (string memory, string memory) {
        return (locador, locatario);
    }

    function setNomes(uint256 _tipo, string memory nome) external {
        if (_tipo == 1) {
            locador = nome;
        } else if (_tipo == 2) {
            locatario = nome;
        }
    }

    function ajustarAluguel(uint256 valor, uint256 mesInicial) public {
        require(mesInicial > 0 && mesInicial < 36, "Mes invalido");
        for (uint256 i = mesInicial; i < 36; i++) {
            valorAluguel[i] += valor;
        }
    }
}
