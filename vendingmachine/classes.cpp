#include <iostream>
#include <iomanip>
#include <map>
#include <string>
using namespace std;

class Refrigerante {
public:
    string nome;
    double preco;

    Refrigerante(string n = "", double p = 0.0) : nome(n), preco(p) {}
};

class Compra {
private:
    double credito;

public:
    Compra() : credito(10.0) {}

    void inserirCredito(double valor) {
        credito += valor;
    }

    double getCredito() const {
        return credito;
    }

    bool registrarCompra(double preco) {
        if (credito >= preco) {
            credito -= preco;
            return true;
        }
        return false;
    }

    double devolverTroco() {
        double troco = credito;
        credito = 0;
        return troco;
    }
};

class MaquinaRefrigerante {
private:
    map<string, pair<Refrigerante, int>> estoque;
    double saldo;

public:
    MaquinaRefrigerante(){
        estoque["Coca-cola"] = {Refrigerante("Coca-cola", 5.25), 20};
        estoque["Guaraná"] = {Refrigerante("Guaraná", 4.70), 20};
        estoque["Fanta"] = {Refrigerante("Fanta", 4.25), 20};
        estoque["Sprite"] = {Refrigerante("Sprite", 3.50), 20};
        estoque["Pepsi"] = {Refrigerante("Pepsi", 4.75), 20};
    }

    void verEstoque() {
        cout << "Estoque atual de refrigerantes:\n";
        for (auto& item : estoque) {
            cout << "- " << item.first << ": " << item.second.second << " unidades\n";
        }
    }

    bool verificarDisponibilidade(string nome) {
        auto it = estoque.find(nome);
        if (it != estoque.end()) {
            return it->second.second > 0; 
    }
        return false;
}

    double getPreco(string nome) {
        return estoque[nome].first.preco;
    }

    void entregarRefrigerante(string nome) {
        if (estoque[nome].second > 0) {
            estoque[nome].second--;
            cout << "Refrigerante " << nome << " entregue!\n";
        }
    }

    void receberPagamento(double valor) {
        saldo += valor;
    }
};
