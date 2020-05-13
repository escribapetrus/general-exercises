class ContaCorrente {
    int agencia;
    int numero;
    double saldo;
    Pessoa cliente;

    double sacar(double val){
        saldo -= val;
        return saldo;
    }

    double depositar(double val){
        saldo += val;
        return saldo;
    }
}