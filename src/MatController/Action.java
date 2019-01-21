package MatController;

public class Action {
	private RC4 r;
	private byte[] plainTEXT;  //암호화할 문장
	private byte[] chyperTEXT; //암호화된 문장
	private byte[] key; //암호화 키

	public Action(String key, String plainTEXT) {
		//String to bytes
		this.plainTEXT = plainTEXT.getBytes();		
		
		this.key = key.getBytes();
	}
	//잘 되는 지 확인해본 코드
	public void printPlainORkey() {
		System.out.print("KEY : ");
		for(int i=0; i<key.length; i++)
			System.out.print(key[i] + " ");
		System.out.println();
		
		System.out.print("PLAINTEXT : ");
		for(int i=0; i<plainTEXT.length; i++)
			System.out.print(plainTEXT[i] + " ");
		System.out.println();
	}
	
	public byte[] encrytion() {
		r = new RC4(key);
		byte[] enc = r.encrypt(plainTEXT);
		chyperTEXT = new byte[enc.length];
		chyperTEXT = enc;
		return enc;
	}

	public byte[] decrytion()  {
		r = new RC4(key);
	
		byte[] enc = r.encrypt(chyperTEXT);
		
		return enc;
	}
}