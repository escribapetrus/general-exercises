public class Car {
    String licensePlate;
    String model;

    public Car(String l, String m){
        licensePlate = l;
        model = m;
    }
    public String showData(){
        return "Seu carro e um " + model + " placa " + licensePlate;
    }
}