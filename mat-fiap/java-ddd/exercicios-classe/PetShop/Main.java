class Main{
    public static void main(String[] args) {

        Section pets = new Section();
        pets.name = "pets";
        pets.id = 1;

        Dog jonas = new Dog();
        jonas.name = "Jonas";
        jonas.breed = "Yorkshire";
        jonas.color = "Black";

        jonas.showDog();


    }
}