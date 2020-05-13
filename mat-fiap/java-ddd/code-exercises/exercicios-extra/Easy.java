class Easy {
    public static void main(String[] args) {
    }
    public int ex1(int i, int j){
        return i + j;
    }
    public int ex2(int n) {
        int res = 0;
        for (int i = 0; i<= n; i++){
           if (i % 3 == 0 || i % 5 == 0) {
              res += i;
           }
        }
        return res;
    }
    public int factorial(int n) {
        if (n == 1) { return 1; } 
        return n * factorial(n-1);
    }
    public int search(int n, int[] list) {
        int res = -1;
        for (int i = 0; i < list.length; i++){
            if (list[i].equals(n)){
                res = i;
                break;
            }
        }
        return res;
    }
    public String reverse(String s) {
        String res = "";
        for (int i=0; i<s.length(); i++){
                res += s.charAt(s.length() - i -1) ; 
        }
        return res;
    }
    public int maximum(Integer[] list) {
        int maxi = 0;
        for (int i = 0; i < list.length; i++) {
                if (list[i] > maxi) {
                    maxi = list[i];
                }
            }
        return maxi;              
    }
    public Double average(List<Integer> list) {
        return list.stream().mapToInt(i -> i).average().getAsDouble();
    }
    public List<String> upperCase(List<String> list) {
        return list.stream().map(String::toUpperCase).collect(Collectors.toList());
    }
}