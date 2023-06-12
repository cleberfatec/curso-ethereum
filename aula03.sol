// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

//0xE86eAEd3dAa1A831102445d187c3409de92da1Bb

contract Aluguel {
    
    struct AluguelEstrutura {
        string locador;
        string locatario;
        uint256[36] valorAluguel;
    }

    AluguelEstrutura private aluguel;

    constructor(string memory _locador, string memory _locatario, uint256 _valorAluguel) {
        aluguel.locador = _locador;
        aluguel.locatario = _locatario;        
        for (uint256 i = 0; i < 36; i++) {
            aluguel.valorAluguel[i] = _valorAluguel;
        }    
    }

    function getValorAluguelPorMes(uint256 _mes) 
    public 
    view 
    mesValido(_mes) 
    returns (uint256) {        
        
        return aluguel.valorAluguel[_mes - 1];
    }

    function getLocadorLocatario() public view returns (string memory, string memory) {
        return (aluguel.locador, aluguel.locatario);
    }

    function setNomes(uint256 _tipo, string memory nome) external {
        if (_tipo == 1) {
            aluguel.locador = nome;
        } else if (_tipo == 2) {
            aluguel.locatario = nome;
        }
    }

    function ajustarAluguel(uint256 valor, uint256 mesInicial) 
    public 
    mesValido(mesInicial)
    {
        for (uint256 i = mesInicial; i < 36; i++) {
            aluguel.valorAluguel[i] += valor;
        }
    }    

    modifier mesValido(uint256 _mes) {
        require(_mes > 0 && _mes <= 36, "Mes invalido");
        _;
    }
}
