package MatController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javazoom.jl.decoder.JavaLayerException;
import matlabcontrol.MatlabConnectionException;
import matlabcontrol.MatlabInvocationException;
import matlabcontrol.MatlabProxy;
/*
class GetMatFile {
	public GetMatFile() {}

	public double[][] getMatFile(String fileName, String dataName) throws FileNotFoundException, IOException {
		MatFileReader mfr = new MatFileReader("C:\\Users\\pjs84\\Desktop\\sample\\" + fileName);
		Map<String, MLArray> map = mfr.getContent();
		MLDouble matrix=(MLDouble)map.get(dataName);
		double[][] data1 = matrix.getArray();
		return data1;
	}	
}
 */



public class Main {	

	public static void main(String[] args) throws MatlabConnectionException, MatlabInvocationException, FileNotFoundException, IOException, JavaLayerException, InterruptedException {
		
		
		FunctionManagement action = new FunctionManagement();
		action.encrytion("김재민1.txt", "김재민1_암호화.txt"); //암호화하기
		boolean sim = action.certification("김재민1.txt", "김성희10.txt"); //인증하기 
		//소리 내기
		SoundPlayer sp = new SoundPlayer();
		sp.soundPlay("C:\\Users\\pjs84\\Desktop\\sample");
		
		/*
		//데이터 가져오기
		IOcontroller getD = new IOcontroller();
		double[][] data = getD.getData("C:\\Users\\pjs84\\Desktop\\sample\\뇌파txt파일", "재민1.txt");		
		//특징값 뽑기
		Similarity similar = new Similarity();
		MatlabProxy proxy = similar.getMatlabProxy();
		double[][] eogFeature = similar.getEogFeature(data, proxy);
		//암호화하기
		AllEog ae = new AllEog("Hi hello");
		ae.setPlainData(eogFeature);
		for(int i=0; i<eogFeature.length; i++) {
			for(int j=0; j<eogFeature[i].length; j++) {
				ae.addEogAttribution(eogFeature[i][j]);
			}
		}
		ae.printEncrytedData(); //암호화한거 뿌리기
		ae.printDecrytedData(); //복호화한거 뿌리기
		ae.printDecrytedData2(); //복호화한거 뿌리기 - String 타입
		ae.printPlainData(); //원래 데이터 뿌리기
		//데이터 저장
		getD.saveEncrytedData("C:\\Users\\pjs84\\Desktop\\sample\\뇌파txt파일", "1암호화.txt", ae); //암호화한거 저장
		getD.saveDecrytedData("C:\\Users\\pjs84\\Desktop\\sample\\뇌파txt파일", "1복호화.txt", ae); //복호화한거 저장
		*/
		
	}
}
