package MatController;

import java.io.UnsupportedEncodingException;

public class EOGofAttribute {
	public byte[] eog;

	public EOGofAttribute(byte[] encrytedEog) {
		this.eog = encrytedEog;
	}
	//byte 타입
	public void printEog() {
		for(int i=0; i<eog.length; i++)
			System.out.print(eog[i] + " ");
		System.out.println();
	}
	//String 타입
	public void printEog2() throws UnsupportedEncodingException {
		String encString = new String(eog,"UTF-8");
		System.out.print(encString + " ");
	}

	public byte[] getEog() {
		return eog;
	}
}

