class WarmupTwo {
    public static void main(String[] args) {
    
        public String stringTimes(String str, int n) {
            String res = "";
            for (int i = 0; i < n; i++) {
                res += str;
            }
            return res;
        }        
        public String frontTimes(String str, int n) {
            String first3 = "";
            String res = "";
            if (str.length() <= 3) {first3 = str;} 
            else {first3 = str.substring(0,3);}            
            for (int i = 0; i < n; i++) {
            res += first3;
            }
            return res;         
        }
        int countXX(String str) {
            int count = 0;
            for (int i = 0; i < str.length()-1;i++){
              boolean isxx = (str.substring(i,i+2).equals("xx"));
              if (isxx) {count += 1;}
            }
            return count;
          }
        
        boolean doubleX(String str) {
            int xidx = str.indexOf("x");
            if (xidx == -1){
                return false;
            } else{
                String x = str.substring(xidx);
                return x.startsWith("xx");
            }
        }
        public String stringBits(String str) {
          String res = "";
          for(int i = 0; i < str.length(); i+=2){
            res += str.charAt(i);
          }
          return res;
        }

    
    
    }
}

