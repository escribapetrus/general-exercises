class WarmupOne {
    public static void main(String[] args) {
    }
    public boolean sleepIn(boolean weekday, boolean vacation) {
        if (!weekday || vacation){
            return true;
        } else {
            return false;
        }
    }
    public boolean monkeyTrouble(boolean aSmile, boolean bSmile) {
        if ((aSmile && bSmile) || (!aSmile && !bSmile)) {
            return true;
        } else {
            return false;
        }
    }
    public int sumDouble(int a, int b) {
        int res = a + b;
        if (a == b){
            res += res;
        }
        return res;
    }
    public int diff21(int n) {
        int res = 21 - n;
        if(n > 21){
            res = res * 2;
        } 
        if (res < 0) {
            res = res * -1;
        }
        return res;
    }
    public boolean parrotTrouble(boolean talking, int hour) {
        if ((hour < 7 || hour > 20) && talking) {
            return true;
        } else {
            return false;
        }
    }
    public boolean makes10(int a, int b) {
        if((a == 10 || b == 10) || (a + b == 10)){
            return true;
        } else {    
            return false;
        }
    }
    public boolean nearHundred(int n) {
        int a = Math.abs(100 - n);
        int b = Math.abs(200 - n);
        return (a <= 10 || b <= 10);
    }
    public boolean posNeg(int a, int b, boolean negative) {
        boolean res = ((a < 0 && b > 0) || (a > 0 && b < 0));
        if (negative) { res = (a<0&&b<0);  }
        return res;
    }   
    public String notString(String str) {
        if (str.length() > 2 && str.substring(0,3).equals("not")) {
            return str;
        } else {
            return "not " + str;
        }
    }
    public String missingChar(String str, int n) {
        String front = str.substring(0,n);
        String back = str.substring(n+1,str.length());        
        return front + back;
      }
    public String frontBack(String str){
        if (str.length() <= 1) return str;
        String mid = str.substring(1, str.length()-1);
        return str.charAt(str.length()-1) + mid + str.charAt(0);
    }
    public String front3(String str) {
        String res;
        if (str.length() <= 3){ res = str;} 
        else { res = str.substring(0,3);}
        return res + res + res;      
    }
    public String backAround(String str) {
        String res;
        String lastltr = "";
        if (str.length() > 0) { lastltr = str.substring(str.length()-1,str.length()); }
        res = lastltr + str + lastltr;
        return res;
    }
    public String stringSplosion(String str) {
        String res = "";
         for (int i=0; i < str.length(); i++){
            res += str.substring(0,i+1);
        }
        return res;
    }
    public int arrayCount9(int[] nums) {
    int res = 0;
    for (int i = 0; i < nums.length; i++){
        if (nums[i] == 9){
            res += 1;
        }
    }
    return res;
    }
    public boolean arrayFront9(int[] nums) {
        boolean res = false;
        if (nums.length <= 4) {
            for (int i = 0; i < nums.length; i++){
                if (nums[i] == 9) { res = true; }
            }
        } else {
            for (int i = 0; i < 4; i++){
                if (nums[i] == 9) { res = true; }
        }
    }
    return res;
    }
    public boolean array123(int[] nums){
        boolean res = false;
        for (int i = 0; i < nums.length - 2; i++){
            if(nums[i] == 1 && nums[i+1] == 2 && nums[i+2] == 3 ) {
                res = true;
            }
        }
        return res;
    }
    public boolean array123(int[] nums){
        boolean res = false;
        for (int i = 0; i < nums.length - 2; i++){
            if(nums[i] == 1 && nums[i+1] == 2 && nums[i+2] == 3 ) {
                res = true;
            }
        }
    return res;
    }
    public String stringX(String str) {
     if (str.length() < 2) return str;
     String res = "";
     res += str.substring(0,1);
     for (int i = 1; i < str.length()-1; i++){       
       if(!(str.substring(i,i+1).equals("x"))){
         res += str.substring(i,i+1);
       }
     }
    res += str.substring(str.length() -1, str.length());
     return res;
    }
    public String altPairs(String str) {
      String res = "";

      for (int i = 0; i < str.length(); i+=4){
        int end = i+2;
        if (end > str.length()){
          end = str.length();
        }
        res += str.substring(i,end);
      }
      
      return res;
    }
}