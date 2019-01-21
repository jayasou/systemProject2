package MatController;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

public class AllEog {
	public ArrayList<EOGofAttribute> eogArr; //암호화된 데이터
	public ArrayList<EOGofAttribute> decrytedEogArr; //복호화된 데이터, 이 데이터를 String 으로 고치면 원래데이터인 plainData가 나옴.
	public double[][] plainData; //원래 데이터
	public String key;
	//public EOGofAttribute eogAtt;
	//public EOGofAttribute decrytedEogAtt;
	public Action a;
	
	public AllEog(String key) {
		//특징점들 암호화한 것들 들어있음.
		eogArr = new ArrayList<EOGofAttribute>(); 
		decrytedEogArr = new ArrayList<EOGofAttribute>();
		this.key = key;
	}
	
	public Action setAction(Double eogFeature) {
		String plaintext = Double.toString(eogFeature);
		a = new Action(key, plaintext);
		return a;
	}

	public void addEogAttribution(Double eogFeature) {
		setAction(eogFeature);
		//암호화된 정보 ADD
		byte[] encrytedEogFeature = getEncrytedData();
		EOGofAttribute eogAtt = new EOGofAttribute(encrytedEogFeature);
		eogArr.add(eogAtt);
		//복호화된 정보 ADD
		byte[] decrytedEogFeature = getDecrytedData();
		EOGofAttribute decrytedEogAtt = new EOGofAttribute(decrytedEogFeature);
		decrytedEogArr.add(decrytedEogAtt);
	}
	
	public byte[] getEncrytedData() {
		byte[] encrytedEogFeature = a.encrytion();
		return encrytedEogFeature;
	}
	
	public byte[] getDecrytedData() {
		byte[] decrytedEogFeature = a.decrytion();
		return decrytedEogFeature;
	}

	public void printEncrytedData() {
		System.out.println("-----암호화 byte 타입-----");
		for(int i=0; i<eogArr.size(); i++) {
			EOGofAttribute temp = eogArr.get(i);
			temp.printEog();
		}
		System.out.println();
		System.out.println("-------------------------");
		System.out.println();
	}
	//복호화타입
	public void printDecrytedData() {
		System.out.println("-----복호화 byte 타입-----");
		for(int i=0; i<decrytedEogArr.size(); i++) {
			EOGofAttribute temp = decrytedEogArr.get(i);
			temp.printEog();
		}
		System.out.println();
		System.out.println("-------------------------");
		System.out.println();
	}
	//String 타입
	public void printDecrytedData2() throws UnsupportedEncodingException {
		System.out.println("-----복호화 String 타입-----");
		for(int i=0; i<decrytedEogArr.size(); i++) {
			EOGofAttribute temp = decrytedEogArr.get(i);
			temp.printEog2();
		}
		System.out.println();
		System.out.println("-------------------------");
		System.out.println();
	}
	
	public void setPlainData(double[][] eogFeature) {
		plainData = eogFeature;		
	}
	
	public void printPlainData() {
		System.out.println("-----원래 문장 타입-----");
		for(int i=0; i<plainData.length; i++) {
			for(int j=0; j<plainData[i].length; j++) {
				System.out.print(plainData[i][j] + " ");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println("-------------------------");
		System.out.println();
	}

	public ArrayList<EOGofAttribute> getArrayListEOGofAttribute() {
		return eogArr;
	}
	
	public ArrayList<EOGofAttribute> getArrayListEOGdecryedOfAttribute() {
		return decrytedEogArr;
	}
}