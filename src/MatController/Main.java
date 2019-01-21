package MatController;

import java.io.FileNotFoundException;
import java.io.IOException;

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

	public static void main(String[] args) throws MatlabConnectionException, MatlabInvocationException, FileNotFoundException, IOException {
		//GetMatFile readMat = new GetMatFile();
		//double[][] data1 = readMat.getMatFile("김재민1(800).mat","data1");

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
		getD.saveEncrytedData("C:\\Users\\pjs84\\Desktop\\sample\\뇌파txt파일", "1암호화.txt", ae); //암호화한거 저장
		getD.saveDecrytedData("C:\\Users\\pjs84\\Desktop\\sample\\뇌파txt파일", "1복호화.txt", ae); //복호화한거 저장
		
		/*
		//성희꺼
		double[][] data2 = getD.getData("C:\\Users\\pjs84\\Desktop\\sample\\뇌파txt파일","떵히0.txt");
		double[][] eogFeature2 = similar.getEogFeature(data2, proxy);
		AllEog ae2 = new AllEog("Hi hello");
		ae2.setPlainData(eogFeature2);
		for(int i=0; i<eogFeature2.length; i++) {
			for(int j=0; j<eogFeature2[i].length; j++) {
				ae2.addEogAttribution(eogFeature2[i][j]);
			}
		}
		 */




		/* 하나 더!!!!!!!!!!!!!!
		System.out.println("00000000000000000000000000000000000000000000000000000000000000000000000");

		GetMatFile readMat2 = new GetMatFile();
		double[][] data12 = readMat2.getMatFile("김규완10(800).mat","data10");
		Similarity similar2 = new Similarity();
		MatlabProxy proxy2 = similar2.getMatlabProxy();
		double[][] eogFeature2 = similar2.getEogFeature("data1", data12, proxy2);

		AllEog ae2 = new AllEog("Hi hello");
		ae2.setPlainData(eogFeature2);
		for(int i=0; i<eogFeature2.length; i++) {
			for(int j=0; j<eogFeature2[i].length; j++) {
				ae2.addEogAttribution(eogFeature2[i][j]);
			}
		}

		ae2.printEncrytedData();
		ae2.printDecrytedData();
		ae2.printDecrytedData2();
		ae2.printPlainData();*/
		//////////////////////////////////////////////////////////// 
		/*
		Similarity similar = new Similarity();
		double svg = similar.getSmiliarity("김재민1(800).mat", "김성희10(700).mat", 
				"data1", "data10");

		//쓰벌 이게 아니야 ...
		String enc = Double.toString(svg);
		Action a = new Action("Hello my name is Jisu", enc);
		a.printPlainORkey(); System.out.println();System.out.println();
		a.encrytion();
		a.decrytion();
		a.encrytion();
		a.decrytion();
		 */
		/*
		GetMatFile readMat = new GetMatFile();
		double[][] data1 = readMat.getMatFile("김재민1(800).mat", "data1");
		double[][] data2 = readMat.getMatFile("김성희10(700).mat", "data10");


		Similarity similar = new Similarity();
		MatlabProxy proxy = similar.getMatlabProxy();
		double[][] jaminEogFeature = similar.getEogFeature("data1",data1, proxy);
		double[][] jaminEogFeature2 = similar.getEogFeature("data10", data2, proxy);

		MatlabTypeConverter processor = new MatlabTypeConverter(proxy);
		processor.setNumericArray("jaminEogFeature", new MatlabNumericArray(jaminEogFeature, null));
		processor.setNumericArray("jaminEogFeature2", new MatlabNumericArray(jaminEogFeature2, null));

		proxy.eval("z = [jaminEogFeature,jaminEogFeature2];");

		proxy.eval("group = cell(1,16);");
		proxy.eval("group(1,1:8) = {'virginica'};");
		proxy.eval("group(1,9:16) = {'versicolor'};");

		proxy.eval("svmStruct = svmtrain(z,group);");

		proxy.eval("ScaleData = getfield(svmStruct, 'ScaleData');");
		proxy.eval("scaleFactor = getfield(ScaleData, 'scaleFactor');");
		proxy.eval("svg = mean(scaleFactor);");

		Object result = proxy.getVariable("svg");
		double svg = Double.parseDouble((String) result);
		 */
	}
}
