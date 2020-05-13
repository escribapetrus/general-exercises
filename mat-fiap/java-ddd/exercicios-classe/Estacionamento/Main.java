import java.util.Scanner;

public class Main{
    public static void main(String[] args){
        Scanner read = new Scanner(System.in);

        System.out.println("Informe o tipo de veiculo:");
        String type = read.next();
        System.out.println("Insira o numero da placa");
        String plate = read.next();
        System.out.println("Insira o modelo");
        String model = read.next();

        if (type == "moto") {
            // Motorcycle ticket = new Motorcycle(plate, model);
            System.out.println("Motoooo");
        } else if (type == "carro") {
            // Car ticket = new Car(plate, model);
            System.out.println("Carroooo");
        }
        
        System.out.println(type);
        System.out.println(model);
        System.out.println(plate);
        
    

    }
}

