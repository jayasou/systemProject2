package MatController;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.Queue;

import javazoom.jl.decoder.JavaLayerException;
import javazoom.jl.player.Player;

public class connectionMindWave {
	public void returnJSP(String id, int no){
		// t=new java.sql.Timestamp(System.currentTimeMillis());
		mainTest mt = new mainTest();
		mt.conn();
		mt.count = 0;
		try {
			mt.send();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			mt.mst = new FileOutputStream("middle.txt");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		mt.ssss = 0;

		while (true) {
			try {
				mt.recv();
				if (mt.state == 0) {
					mt.write_file(id, no);
					mt.ssss++;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			/*
			 * if(mt.ssss == 300) { mt.ssss = 0; mt.state = 1; }
			 */
			if (mt.ssss == 4) // 횟수 정해줘 (2560 * n)
			{

				mt.ssss = 0; // n번 초기화
				mt.state = 1; // 상태 초기화
				// 측정 완료된 상태
				// todo ex) 버튼 상태 조절
				break;
			}
			mt.count = 0;
		}
	}
}