public class Motorcycle {
    String licensePlate;
    String model;

    public Motorcycle(String l, String m){
        licensePlate = l;
        model = m;
    }

    public String showData(){
        return "Sua moto e uma " + model + " placa " + licensePlate;
    }

}