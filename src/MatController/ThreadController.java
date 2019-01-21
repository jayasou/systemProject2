package MatController;

import java.io.FileNotFoundException;

import javazoom.jl.decoder.JavaLayerException;

public class ThreadController {
	String id = null;
	int no = 0;
	public ThreadController(String id, int no) {this.id = id; this.no = no;}
	public void start() {
		ThreadConnection tc = new ThreadConnection(new connectionMindWave(), id, no);
		ThreadSound ts = new ThreadSound(new SoundPlayer(),"C:\\Users\\ccy58\\Desktop\\sample");
		

		ts.start();
		tc.start();
		try{
			tc.join();
		}
		catch(InterruptedException e){
			e.printStackTrace();
		}
	}
}

class ThreadConnection extends Thread {
	public connectionMindWave cm;
	String id = "";
	int no = 0;
	public ThreadConnection(connectionMindWave cm, String id, int no) {
		this.id = id;
		this.no = no;
		this.cm = cm;
	}
	
	public void run() {
		cm.returnJSP(id, no);
	}
}

class ThreadSound extends Thread {
	public SoundPlayer sp;
	public String path;
	
	public ThreadSound(SoundPlayer sp, String path) {
		this.sp = sp;
		this.path = path;
	}
	
	public void run() {
		try {
			sp.soundPlay(path);
		} catch (FileNotFoundException | JavaLayerException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}