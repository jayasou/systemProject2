package MatController;

import java.io.*;

public class FFTDrive {

    /////////////////////////////////////////////////////////
    //임시 테스트(공)
    //데이터 구하는 식은 Break의 ssss * 5 입니다
    final int data_size = 20;
    final int trial = 1;	// trial
    final int one_trial_sec = 100; //trial
    final int thetaRange = 8 - 4 + 1;	//
    final int alphaRange = 6;	// alpha
    final int alphaHRange = 4;	// alphaH
    final int betaRange = 18;	// beta
    final int gammaRange = 91;	// gamma
    /////////////////////////////////////////////////////////

    final int all_trial_sec = trial * one_trial_sec; //
    final int one_sec_size = 512; //
    final int all_trial_data = trial * one_trial_sec * one_sec_size;
    final double[] rawData = new double[all_trial_data];
    final int mp = 15;
    final double c[][] = new double[trial * one_trial_sec][one_sec_size / 2];
    final double temp[] = new double[one_sec_size];
    final double fftTemp[] = new double[one_sec_size];

    /////////////////////////////////////////////////////////
    final double theta[][] = new double[thetaRange][all_trial_sec];
    final double alpha[][] = new double[6][all_trial_sec];
    //static double alphaH[][] = new double[alphaHRange][all_trial_sec];
    final double beta[][] = new double[betaRange][all_trial_sec];
    final double gamma[][] = new double[gammaRange][all_trial_sec];

    final double a_t[] = new double[all_trial_sec];
    final double a_a[] = new double[all_trial_sec];
    //static double a_aH[] = new double[all_trial_sec];
    final double a_b[] = new double[all_trial_sec];
    final double a_g[] = new double[all_trial_sec];

    final double theta_moving[] = new double[all_trial_sec];
    final double alpha_moving[] = new double[all_trial_sec];
    //static double alphaH_moving[] = new double[all_trial_sec];
    final double beta_moving[] = new double[all_trial_sec];
    double gamma_moving[] = new double[all_trial_sec];
    //String userName = jTextField1.getText();
    //static double alphaHtmp_;
    int count = 0;

    FFT fft = new FFT();

    public void read_file(String userName, int Filecount) {
        int count = 0;
        String path = "C:\\Users\\ccy58\\Desktop\\sample\\뇌파txt파일";
        String temp_fileName = userName + Filecount + ".txt";
        File file = new File(path, temp_fileName);
        try {
            FileReader fileReader = new FileReader(file);
            BufferedReader reader = new BufferedReader(fileReader);

            String temp_ = null;

            while ((temp_ = reader.readLine()) != null) {
                if (count < all_trial_data) {
                    rawData[count] = Integer.parseInt(temp_);
                    count++;
                } else {
                    break;
                }

            }
            fileReader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public void alpha_write() {
        //String raw[] = new String[rawData.length];
        try {
            FileWriter file_output = new FileWriter("C:\\Users\\ccy58\\Desktop\\sample\\alpha.txt");
            BufferedWriter bw = new BufferedWriter(file_output);

            for (int i = 0; i < alpha_moving.length; i++) {
                String alpha = Double.toString(alpha_moving[i]);

                bw.write(alpha);
                bw.write('\n');
                bw.flush();
            }

            file_output.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void beta_write() {
        //String raw[] = new String[rawData.length];
        try {
            FileWriter file_output = new FileWriter("beta.txt");
            BufferedWriter bw = new BufferedWriter(file_output);

            for (int i = 0; i < beta_moving.length; i++) {
                String beta = Double.toString(beta_moving[i]);

                bw.write(beta);
                bw.write('\n');
                bw.flush();
            }

            file_output.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public double gamma_write() {
        double gamma_avg = 0;
        //String raw[] = new String[rawData.length];
        try {
            /*
		FileWriter file_output = new FileWriter("gamma.txt");
		BufferedWriter bw = new BufferedWriter(file_output);
             */
            //gamma_moving.length
            double gamma_sum = 0;
            for (int i = 0; i < data_size; i++) {
                /*  데이터를 파일에 저장하는 코드
			String gamma = Double.toString(gamma_moving[i]);
			bw.write(gamma);
			bw.write(" ");
			bw.flush();
                 */
                gamma_sum += gamma_moving[i];
            }
            //평균입니다.
            gamma_avg = gamma_sum / data_size;

            //file_output.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gamma_avg;
    }

    public void drive() {
        int startRange = 0;
        int cutRange = 500;

        for (int i = 0; i < all_trial_sec; i++) {
            int tempStart = 0;

            for (int j = startRange; j < cutRange; j++) {

                temp[tempStart++] = rawData[j];

            }
            startRange = cutRange;
            cutRange = cutRange + one_sec_size;

            fft.computeFFT(temp);

            for (int l = 0; l < temp.length; l++) {
                fftTemp[l] = Math.sqrt(fft.real[l] * fft.real[l] + fft.imag[l] * fft.imag[l]);
                temp[l] = Math.abs(fftTemp[l]);

            }

            for (int k = 0; k < one_sec_size / 2; k++) {
                c[count][k] = temp[k];
            }
            count += 1;
        }

        //
        int tempStart2 = 0;
        for (int j = 51200 - 512; j < 51200; j++) {
            temp[tempStart2] = rawData[j - 1];
            tempStart2++;

        }

        fft.computeFFT(temp);

        for (int l = 0; l < temp.length; l++) {
            fftTemp[l] = Math.sqrt(fft.real[l] * fft.real[l] + fft.imag[l] * fft.imag[l]);
            temp[l] = Math.abs(fftTemp[l]);
        }

        for (int k = 0; k < one_sec_size / 2; k++) {
            c[count - 1][k] = temp[k];
        }

        for (int x = 0; x < count; x++) {
            for (int t = 4; t <= 8; t++) {
                theta[t - 4][x] = Math.log10(c[x][t - 1]);

            }
            for (int a = 8; a <= 13; a++) {
                alpha[a - 8][x] = Math.log10(c[x][a - 1]);
            }
            for (int b = 13; b <= 30; b++) {
                beta[b - 13][x] = Math.log10(c[x][b - 1]);
            }
            for (int g = 30; g <= 120; g++) {
                gamma[g - 30][x] = Math.log10(c[x][g - 1]);
            }

        }

        // Complete here;
        double thetaAvg;
        double alphaAvg;
        //double alphaHAvg;
        double betaAvg;
        double gammaAvg;

        double thetaAvgTemp = 0;
        double alphaAvgTemp = 0;
        //double alphaHAvgTemp = 0;
        double betaAvgTemp = 0;
        double gammaAvgTemp = 0;

        for (int i = 0; i < data_size; i++) {
            thetaAvgTemp = 0;
            alphaAvgTemp = 0;
            betaAvgTemp = 0;
            gammaAvgTemp = 0;

            for (int t = 0; t < thetaRange; t++) {
                thetaAvgTemp += theta[t][i];
            }
            thetaAvg = thetaAvgTemp / thetaRange;

            for (int a = 0; a < 6; a++) {
                alphaAvgTemp += alpha[a][i];
            }
            alphaAvg = alphaAvgTemp / 6;

            /*
		for(int ah = 0; ah < alphaHRange; ah++)
		{
			alphaHAvgTemp += alphaH[ah][i];
		}		
		alphaHAvg = alphaHAvgTemp / alphaHRange;
             */
            for (int b = 0; b < betaRange; b++) {
                betaAvgTemp += beta[b][i];
            }
            betaAvg = betaAvgTemp / betaRange;

            for (int g = 0; g < gammaRange; g++) {
                gammaAvgTemp += gamma[g][i];
            }
            gammaAvg = gammaAvgTemp / gammaRange;

            a_t[i] = thetaAvg;
            a_a[i] = alphaAvg;
            //a_aH[i] = alphaHAvg;
            a_b[i] = betaAvg;
            a_g[i] = gammaAvg;
        }

        //Complete here;
        //int size_c = a_t.length; 
        int size_c = data_size;
        double tmp;
        int tmp_;

        for (int x = 0; x < size_c; x++) {
            tmp = 0;
            tmp_ = x;
            for (int s = 1; s <= mp; s++) {
                if ((s + tmp_) >= size_c) {
                    tmp_ = 1;
                }
                tmp = tmp + a_t[s + tmp_];
            }
            theta_moving[x] = tmp / mp;
        }

        for (int x = 0; x < size_c; x++) {
            tmp = 0;
            tmp_ = x;
            for (int s = 1; s <= mp; s++) {
                if ((s + tmp_) >= size_c) {
                    tmp_ = 1;
                }
                tmp = tmp + a_a[s + tmp_];
            }
            alpha_moving[x] = tmp / mp;
        }
        /*
	for(int x = 0; x < size_c; x++)
	{
		tmp = 0;
		tmp_ = x;
		for(int s = 0; s < mp; s++)
		{
			if((s + tmp_) >= size_c)
				tmp_ = 1;
			tmp = tmp + a_aH[s+tmp_];
		}
		alphaH_moving[x] = tmp / mp;
	}
         */
        for (int x = 0; x < size_c; x++) {
            tmp = 0;
            tmp_ = x;
            for (int s = 1; s <= mp; s++) {
                if ((s + tmp_) >= size_c) {
                    tmp_ = 1;
                }
                tmp = tmp + a_b[s + tmp_];
            }
            beta_moving[x] = tmp / mp;
        }

        for (int x = 0; x < size_c; x++) {
            tmp = 0;
            tmp_ = x;
            for (int s = 1; s <= mp; s++) {
                if ((s + tmp_) >= size_c) {
                    tmp_ = 1;
                }
                tmp = tmp + a_g[s + tmp_];
            }
            gamma_moving[x] = tmp / mp;
        }

        //size_c = alpha_moving.length;
        for (int x = 0; x < size_c; x++) {
            tmp = theta_moving[x] + alpha_moving[x] + beta_moving[x] + gamma_moving[x];
            theta_moving[x] = theta_moving[x] / tmp;
            alpha_moving[x] = alpha_moving[x] / tmp;
            //alphaH_moving[x] = alphaH_moving[x]/tmp;
            beta_moving[x] = beta_moving[x] / tmp;
            gamma_moving[x] = gamma_moving[x] / tmp;
        }
    }
}