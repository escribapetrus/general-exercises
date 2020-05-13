class App {
    public static void main(String[] args){
        User Quorthon = new User();
            Quorthon.id = 423423;
            Quorthon.username = "Quorthon";
            Quorthon.firstName = "John";
            Quorthon.lastName = "Addams";
            Quorthon.isSingle = true;

        Group Bathory = new Group();
            Bathory.id = 34235425;
            Bathory.groupName = "Bathory";
            Bathory.description = "Swedish rock band";

        System.out.println(Quorthon.firstName + " " + Quorthon.lastName);
    }
}