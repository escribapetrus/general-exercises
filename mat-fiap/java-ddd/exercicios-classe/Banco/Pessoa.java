class Pessoa {
    String nome;
    String rg;
    int cpf;
    String endereco;
    String dataNascimento;

    void exibirDados(){
        System.out.printf("Nome: %s\nRG: %s\nCPF: %d\nEndereco: %s\nData de Nascimento: %s\n",
            nome, rg, cpf, endereco, dataNascimento
        );
    }
    String informarEndereco(){
        return endereco;
    }
}