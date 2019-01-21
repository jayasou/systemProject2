package MatController;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

import javazoom.jl.decoder.JavaLayerException;
import javazoom.jl.player.Player;

public class SoundPlayer {
	public void SoundPlay() { }
	
	public void soundPlay(String path) throws FileNotFoundException, JavaLayerException, InterruptedException {
		for(int i=0; i<9; i++) {
			FileInputStream f = new FileInputStream(new File(path, "beep.mp3"));
			Player p = new Player(f);
			p.play();
			p.close();
			Thread.sleep(2000);
		}
	}
}
