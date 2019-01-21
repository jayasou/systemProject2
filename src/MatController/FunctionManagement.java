package MatController;

import java.io.IOException;
import java.util.ArrayList;

import matlabcontrol.MatlabConnectionException;
import matlabcontrol.MatlabInvocationException;
import matlabcontrol.MatlabProxy;

/*
 * 1. 인증하기
 * 		- 측정 뇌파에서 특징 값 뽑기(데이터1)
 * 		- 두 개의 데이터(암호화->복호화 & 데이터1) 비교
 * 		- 비교한 값, 즉, 유사도 측정 후 90%이상 일 때 인증 완료
 * 		- return true; 일 때 인증 성공
 * 		- 비교할 원래의 데이터가 저장된 파일 이름, 암호화된 데이터가 저장된 파일이름 필요 
 * 2. 암호화하기
 * 		- 측정 뇌파에서 특징 값 뽑기
 * 		- 특징 값 암호화
 * 		- 암호화된 데이터를 파일에 저장
 * 		- 측정된 뇌파 데이터가 저장된 파일 이름, 암호화된 데이터를 저장할 파일 이름 필요
 */
public class FunctionManagement {
	public MatlabProxy proxy;
	public Similarity similar;
	public String path;

	public FunctionManagement() throws MatlabConnectionException {
		similar = new Similarity();
		proxy = similar.getMatlabProxy();
		path = "C:\\Users\\ccy58\\Desktop\\sample\\뇌파txt파일";
	}

	//인증하기
	public boolean certification(String encrytedDatafileName, String plainDataFileName) throws IOException, MatlabConnectionException, MatlabInvocationException {
		IOcontroller io = new IOcontroller();

		//복호화된 데이터 Double[][] decrytedDataArr 에 저장
		double[][] decrytedDataArr = io.getData(path, encrytedDatafileName);
		//double[][] decrytedDataArr = io.getEncrytedData(path, encrytedDatafileName);

		//측정된 데이터 가져오기
		double[][] plainDataArr = io.getData(path, plainDataFileName);
		//복호화된 데이터 decrytedDataArr와 인증할 데이터 plainDataArr의 유사도 측정
		try{
			double svg = similar.getSmiliarityUsingFlexible(decrytedDataArr, plainDataArr, proxy);
			System.out.println(svg);
			if(svg > 9)
				return true;
			else
				return false;
		}catch(NullPointerException ne){
			System.out.println(ne.getMessage());
		}
		return false;
		
	}

	//암호화하기
	public void encrytion(String plainDataFileName,String encrytedDatafileName) throws IOException, MatlabConnectionException, MatlabInvocationException {
		//데이터 가져오기
		IOcontroller io = new IOcontroller();
		double[][] data = io.getData(path, plainDataFileName);

		//특징값 뽑기
		
			double[][] eogFeature = similar.getEogFeature(data, proxy);
			if(eogFeature == null) {
				System.out.println("eog feature가 null");
			}
			//암호화하기
			AllEog ae = new AllEog("encrytionCode");
			ae.setPlainData(eogFeature);
			for(int i=0; i<eogFeature.length; i++) {
				for(int j=0; j<eogFeature[i].length; j++) {
					ae.addEogAttribution(eogFeature[i][j]);
				}
		}
			//암호화 데이터를 path경로에 "encrytedDatafileName" 이름으로 txt에 저장
			//io.createFile(path, encrytedDatafileName);
			io.saveEncrytedData(path, encrytedDatafileName, ae);
	}
	
	public void measurement(String id, int no) {
		ThreadController tc = new ThreadController(id, no);
		tc.start();
	}
}
