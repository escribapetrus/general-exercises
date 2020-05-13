import java.util.Scanner;

class Main {
    public static void main(String[] args) {        
        ContaCorrente conta001 = new ContaCorrente();
        Pessoa user001 = new Pessoa();
        Scanner read = new Scanner(System.in);
        //INFORMACOES DO CLIENTE
        user001.nome = "John";
        user001.rg = "23425";
        user001.cpf = 454324656;
        user001.endereco = "Rua Qualquer Coisa, 6";
        user001.dataNascimento = "01/01/0001";
        //INFORMACOES DA AGENCIA
        conta001.agencia = 9223;
        conta001.numero = 34234;
        conta001.saldo = 1000.00;
        conta001.cliente = user001;

        user001.exibirDados();

        //OPERACOES DE SAQUE E DEPOSITO
        System.out.println("Insira um valor para saque");
        double saq = read.nextInt();
        System.out.println("Insira um valor para deposito");
        double dep = read.nextInt();

        conta001.depositar(dep);
        conta001.sacar(saq);

        //MOSTRAR SALDO RESTANTE
        System.out.println("Saldo disponivel:" + conta001.saldo);    
    }
}