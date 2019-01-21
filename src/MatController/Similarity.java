package MatController;

import java.io.FileNotFoundException;
import java.io.IOException;

import matlabcontrol.MatlabConnectionException;
import matlabcontrol.MatlabInvocationException;
import matlabcontrol.MatlabProxy;
import matlabcontrol.MatlabProxyFactory;
import matlabcontrol.extensions.MatlabNumericArray;
import matlabcontrol.extensions.MatlabTypeConverter;

public class Similarity {

	public Similarity() {}	

	public MatlabProxy getMatlabProxy() throws MatlabConnectionException {
		MatlabProxyFactory factory = new MatlabProxyFactory();
		MatlabProxy proxy = factory.getProxy();	
		return proxy;
	}
	/*
	//.m 파일 읽었을 때
	public double[][] getEogFeature(String dataName, double[][] data1, MatlabProxy temp) throws MatlabConnectionException, MatlabInvocationException {

		MatlabProxy proxy = temp;
		MatlabTypeConverter processor = new MatlabTypeConverter(proxy);
		processor.setNumericArray("data1", new MatlabNumericArray(data1, null));
		proxy.eval("data1 = transpose(data1);");	

		proxy.eval("temp = data1;");
		proxy.eval("sT = length(temp);");

		proxy.eval("addpath('C:\\Users\\pjs84\\Desktop\\sample')");
		proxy.eval("imfs = emd(temp);");		

		proxy.eval("[tx,ty] = size(imfs);");
		proxy.eval("sum = zeros(1,sT);");

		proxy.eval("for x = 3 : tx sum = sum + imfs(x,:); end");
		proxy.eval("data1 = sum'; ");proxy.eval("[size_r, size_c] = size(data1);");
		proxy.eval("norm = data1;");
		proxy.eval("[peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 800);");
		proxy.eval("eogFeature1 = getPeaks( norm, loc, size_r );");



		double[][] jaminEogFeature = processor.getNumericArray("eogFeature1").getRealArray2D();


		return jaminEogFeature;
	}

	public double getSmiliarity(String fileName1, String fileName2, String path1, String path2) throws FileNotFoundException, IOException, MatlabConnectionException, MatlabInvocationException {

		//입력받아야 할 것은 , fileName, dataName 
		GetMatFile readMat = new GetMatFile();
		double[][] data1 = readMat.getMatFile(fileName1, dataName1);
		double[][] data2 = readMat.getMatFile(fileName2, dataName2);


		IOcontroller io = new IOcontroller();
		double[][] data1 = io.getData(fileName1, path1);
		double[][] data2 = io.getData(fileName2, path2);


		Similarity similar = new Similarity();
		MatlabProxy proxy = similar.getMatlabProxy();
		double[][] jaminEogFeature = similar.getEogFeature(data1, proxy);
		double[][] jaminEogFeature2 = similar.getEogFeature(data2, proxy);

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

		double svg = ((double[]) proxy.getVariable("svg"))[0]; 
		return svg;
	}
	 */
	//txt파일 읽을 때
	public double[][] getEogFeature(double[][] data1, MatlabProxy temp) throws MatlabConnectionException, MatlabInvocationException {

		MatlabProxy proxy = temp;
		MatlabTypeConverter processor = new MatlabTypeConverter(proxy);
		processor.setNumericArray("data1", new MatlabNumericArray(data1, null));
		proxy.eval("data1=transpose(data1);");	

		proxy.eval("temp=data1");
		proxy.eval("sT=length(temp);");

		proxy.eval("addpath('C:\\Users\\ccy58\\Desktop\\sample')");
		proxy.eval("imfs=emd(temp)");		

		proxy.eval("[tx,ty] = size(imfs);");
		proxy.eval("sum=zeros(1,sT);");

		proxy.eval("for x=3 : tx sum=sum+imfs(x,:); end");
		proxy.eval("data1 = sum'; ");proxy.eval("[size_r, size_c] = size(data1);");
		proxy.eval("norm = data1;");
		proxy.eval("[peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 800);");
		proxy.eval("eogFeature1 = getPeaks( norm, loc, size_r );");

		double[][] jaminEogFeature = processor.getNumericArray("eogFeature1").getRealArray2D();
		return jaminEogFeature;

	}

	public double getSmiliarity(double[][] x1, double[][] x2) throws FileNotFoundException, IOException, MatlabConnectionException, MatlabInvocationException {

		MatlabProxy proxy = getMatlabProxy();
		double[][] jaminEogFeature = getEogFeature(x1, proxy);
		double[][] jaminEogFeature2 = getEogFeature(x2, proxy);

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

		double svg = ((double[]) proxy.getVariable("svg"))[0]; 
		return svg;
	}
	
	public double getSmiliarityUsingFlexible(double[][] x1, double[][] willGetEogF, MatlabProxy temp) throws MatlabConnectionException, MatlabInvocationException {
		MatlabProxy proxy = temp;
		double[][] jaminEogFeature = getEogFeature(x1, proxy);
		double[][] jaminEogFeature2 = getEogFeature(willGetEogF, proxy);

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

		double svg = ((double[]) proxy.getVariable("svg"))[0]; 
		return svg;
	}

}
