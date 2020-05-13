class App {
    public static void main(String[] args) {
        Cliente cli = new Cliente();
        cli.nomeCompleto = "John";
        cli.cpf = 425423;
        cli.rg = "32542364-3";
        cli.endereco = "Rua das Maçãs, 213";

        ContaCorrente cc = new ContaCorrente();
        cc.agencia = 234235;
        cc.numero = 4234234;
        cc.saldo = 12333.34;
        cc.cliente = cli;

        System.out.println(cc.cliente.nomeCompleto);
    }
}