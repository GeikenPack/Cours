public class ThreadTest2 {
  public static int i = 0;
  public static void main(String[] args) {
   // lancer 5 threads qui incrémentent i

   for(int j=0;j<5;j++) {
     Thread t1 = new Thread() {
       public void run() {
         for(int j=0; j<100000; j++)
           i++; 
       }
     };
     t1.start();
   }

   try {
          Thread.sleep(500); // devrait suffire largement
   } catch (InterruptedException ignored) { }

   System.out.println("Valeur de i : " +i);
   System.out.println("(devrait etre 500000)");
  }
}

