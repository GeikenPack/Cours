public class ThreadTest1 {
	public static boolean running = true;
	public static void main(String[] args) {
		// un premier Thread qui lit la variable running
		Thread t1 = new Thread() {
			public void run() {
				int counter = 0;
				while (running) {
					counter++;
					//if((counter % 10000000) == 0) System.out.println(counter); 
				}
				System.out.println("Thread 1 fini. counter="+counter);
			}
		};
		// un second Thread qui modifie la variable running
		Thread t2 = new Thread() {
			public void run() {
				try {
					Thread.sleep(100);
				} catch (InterruptedException ignored) { }
				System.out.println("Thread 2 fini");
				running = false;
			}
		};
		t1.start();
		t2.start();
	} 
}