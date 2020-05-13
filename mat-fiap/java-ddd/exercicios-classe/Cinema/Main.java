class Main {
    public static void main(String[] args) {
        Sala sala1 = new Sala();
        sala1.capacidade = 50;
        sala1.lugaresOcupados = 22;

        Cinema cinema1 = new Cinema();
        cinema1.preco = 29.90;
        cinema1.sala = sala1;

        System.out.println(cinema1.sala.capacidade);
    }
}