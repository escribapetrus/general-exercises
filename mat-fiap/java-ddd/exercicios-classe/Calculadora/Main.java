import java.util.Scanner;

class Main{
    public static void main(String[] args) {
        Calculadora calc = new Calculadora();
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite um numero ");
        int n1 = entrada.nextInt();
        System.out.print("Digite outro numero ");
        int n2 = entrada.nextInt();

        int ressoma = calc.soma(n2,n2);
        int resmult = calc.multiplicacao(n1,n2);
        int ressubt = calc.subtracao(n1,n2);
        int resdiv = calc.divisao(n1,n2);

        System.out.println("a soma foi " + ressoma);
        System.out.println("a multiplicacao foi " + resmult);
        System.out.println("a subtracao foi " + ressubt);
        System.out.println("a divisao foi " + resdiv);
    }
}