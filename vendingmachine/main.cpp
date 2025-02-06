#include "classes"
int main() {
    MaquinaRefrigerante maquina;
    Compra compra;
    int opcao;

    cout << "Bem-vindo!\n";
    maquina.verEstoque();
    cout << "\nCrédito atual: R$" << fixed << setprecision(2) << compra.getCredito() << endl;
    while (1) {
        cout << "\nMenu:\n";
        cout << "1. Colocar crédito\n";
        cout << "2. Escolher refrigerante\n";
        cout << "3. Verificar troco\n";
        cout << "4. Ver estoque\n";
        cout << "5. Sair\n";
        cout << "Escolha uma opção: ";

        cin >> opcao;

        switch(opcao){
        case 1:
        {
            cout << "Insira o valor do crédito (0.10, 0.25, 0.50, 1.00): ";
            double valor;
            cin >> valor;
            if (valor == 0.10 || valor == 0.25 || valor == 0.50 || valor == 1.00) {
                compra.inserirCredito(valor);
                cout << "Crédito atual: R$" << fixed << setprecision(2) << compra.getCredito() << endl;
                break;
            } else {
                cout << "Valor inválido!\n";
            }
        }
        case 2:
        {
            cout << "Escolha um refrigerante (Coca-cola, Guaraná, Fanta, Sprite, Pepsi): ";
                string nome;
                cin.ignore();
                getline(cin, nome);

                if (maquina.verificarDisponibilidade(nome)) {
                    double preco = maquina.getPreco(nome);
                    if (compra.registrarCompra(preco)) {
                            maquina.entregarRefrigerante(nome);
                            maquina.receberPagamento(preco);
                    } else {
                        cout << "Crédito insuficiente! Preço do refrigerante: R$ " << preco << "\n";
                        break;
                    }
                } else { 
                        cout << "Refrigerante indisponível no momento.\n";
                        break;
                }
        }
        case 3:
        {
            double troco;
            troco = compra.devolverTroco();
            cout << "Troco devolvido: R$ " << fixed << setprecision(2) << troco << "\n";
            break;
        }
        case 4:
        {
            maquina.verEstoque();
            break;
        }
        case 5:
        {
            cout << "Obrigado por usar a máquina. Até mais!\n";
            return 0;
        }
        default:
            cout << "\nOpção inválida!!!" << endl;
            break;
        }
    }
}
