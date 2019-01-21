package MatController;

import java.io.*;
import java.util.ArrayList;

public class IOcontroller {
	public IOcontroller() {	}

	public double[][] getData(String path,String fileName) throws IOException {
		BufferedReader in = null;
		in = new BufferedReader(new FileReader(new File(path, fileName)));		
		int cnt=0;
		while((in.readLine()) != null) {
			cnt++;
		}		
		double[][] data = new double[cnt][1];
		int tempCnt = 0;
		in.close();		

		in = new BufferedReader(new FileReader(new File(path,fileName)));
		String k;
		while((k= in.readLine()) != null) {			
			double d = Double.parseDouble(k);
			data[tempCnt++][0] = d;
		}
		in.close();

		return data;
	}
	//암호화데이터 txt파일에 저장
	   public void saveEncrytedData(String path, String fileName, AllEog ae) throws IOException {
	      File encrytedFile = new File(path, fileName);
	      encrytedFile.createNewFile();
	      
	      FileOutputStream byteout = new FileOutputStream(encrytedFile);
	      

	      ArrayList<EOGofAttribute> eogArr = ae.getArrayListEOGofAttribute();

	      for(int i=0; i<eogArr.size(); i++) {
	         byte[] temp = eogArr.get(i).getEog();
	         byteout.write(temp);
	         byteout.write("\r\n".getBytes());
	      }
	      
	      byteout.close();

	   }
	
	public void saveDecrytedData(String path, String fileName, AllEog ae) throws IOException {
		FileOutputStream byteout = new FileOutputStream(new File(path, fileName));
		
		ArrayList<EOGofAttribute> eogDecrytedArr = ae.getArrayListEOGdecryedOfAttribute();
		
		System.out.println();
		System.out.println("여긴 복호화 save 함수");	

		for(int i=0; i<eogDecrytedArr.size(); i++) {
			byte[] temp = eogDecrytedArr.get(i).getEog();			
			byteout.write(temp);
			byteout.write("\n".getBytes());
			//Just print
			for(int j=0; j<temp.length; j++) {
				String s = Byte.toString(temp[j]);
				System.out.print(s + " ");
			}System.out.println();
		}
		byteout.close();
	}
	public void convertData(String path, String fileName) throws IOException {
	      BufferedReader in = null;
	      in = new BufferedReader(new FileReader(new File(path, fileName)));      
	      int cnt=0;
	      while((in.readLine()) != null) {
	         cnt++;
	         if(cnt == 10000)
	            break;
	      }      
	      double[][] data = new double[cnt][1];
	      int tempCnt = 0;
	      in.close();      

	      in = new BufferedReader(new FileReader(new File(path,fileName)));
	      String k;
	      while((k= in.readLine()) != null) {         
	         double d = Double.parseDouble(k);
	         data[tempCnt++][0] = d;
	         if(tempCnt == 10000)
	            break;
	      }
	      in.close();
	      
	      BufferedWriter out = null;
	      out = new BufferedWriter(new FileWriter(new File(path,fileName)));   
	      
	      for(int i=0; i<data.length; i++) {
	         for(int j=0; j<data[i].length; j++) {
	            out.write(Double.toString(data[i][j]));
	            out.write("\r\n");
	         }
	      }
	      
	      out.close();
	   }
}