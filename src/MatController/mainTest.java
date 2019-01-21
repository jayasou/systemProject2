package MatController;

import java.io.*;
import java.util.*;
import java.net.*;

public class mainTest extends Thread {

        private Socket client;
        private byte[] data = new byte[8192];
        private int size = 8192;
        private String stringData;
        public int state = 0;
        private int length;
        private int rawdata;
        private double[] eegpow = new double[8];
        private int ad;
        private int md;
        private Queue<Integer> rawque = new LinkedList<Integer>();
        private InetAddress ia;
        public int count = 0;
        int ssss = 0;
        FileOutputStream st;
        FileOutputStream mst;
        int ft = 60;

        public int[] datas = new int[2560];

        public void conn() {
            try {
                ia = InetAddress.getByName("127.0.0.1");

            } catch (UnknownHostException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            try {
                client = new Socket(ia, 13854);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        public void recv() throws IOException {
            for (; count < 2560;) {
                int temp = client.getInputStream().read(data);
                for (int j = 0; j < temp; j++) {
                    paser(data[j]);
                }
            }
        }

        public void send() throws IOException {
            OutputStream os = client.getOutputStream();
            OutputStreamWriter osr = new OutputStreamWriter(os);
            BufferedWriter bw = new BufferedWriter(osr);
            PrintWriter pw = new PrintWriter(bw);
            pw.println("{\"enableRawOutput\": true, \"format\": \"BinaryPacket\"}");
            pw.flush();
        }

        public void write_file(String id, int Filecount) throws IOException {
            if (ft >= 60) {
                //st = new FileOutputStream(Integer.toString(sCalendar.get(Calendar.MONTH))+" "+Integer.toString(sCalendar.get(Calendar.DATE))+" "+Integer.toString(sCalendar.get(Calendar.HOUR))+" "+Integer.toString(sCalendar.get(Calendar.MINUTE))+" "+Integer.toString(sCalendar.get(Calendar.SECOND))+".txt");
                st = new FileOutputStream("C:\\Users\\ccy58\\Desktop\\sample\\뇌파txt파일\\"+id+Filecount+".txt");
                ft = 0;
            }
            PrintWriter wt = new PrintWriter(st);
            for (int i = 0; i < 2560; i++) {
                wt.println(datas[i]);
                wt.flush();
            }
            if (ft >= 60) {
                st.close();
            } else {
                ft++;
            }
        }

        public void paser(byte data) throws FileNotFoundException {
            PrintWriter wt = new PrintWriter(mst);
            switch (state) {
                case 0:
                    if (data == (byte) 0xAA) {
                        state = 1;
                    }
                    break;
                case 1:
                    if (data == (byte) 0xAA) {
                        state = 2;
                    } else {
                        state = 0;
                    }
                    break;
                case 2:
                    if (data == (byte) 0x02) {
                        state = 5;
                    } else if (data == (byte) 0x80) {
                        state = 3;
                    }
                    break;
                case 3:
                    length = data;
                    state = 4;
                    break;
                case 4:
                    int temp = (int) data;
                    rawdata = rawdata + (temp << ((length - 1) * 8));
                    wt.print(data + " ");
                    wt.flush();

                    if (--length <= 0) {
                        state = 0;
                        rawque.offer(rawdata);
                        if (count < 2560) {
                            datas[count] = rawdata;
                            count++;
                        }
                        wt.println("");
                        wt.println(rawdata);
                        wt.flush();
                        rawdata = 0;
                    }
                    break;
                case 5:
                    System.out.println("SignalPool : " + data);
                    state = 6;
                    break;
                case 6:
                    if (data == (byte) 0xAA) {
                        state = 1;
                    } else if (data == (byte) 0x81) {
                        state = 7;
                    }
                    break;
                case 7:
                    length = data;
                    state = 8;
                    break;
                case 8:
                    eegpow[(32 - length) / 4] = eegpow[(32 - length) / 4] + (data << ((32 - length) % 4));
                    if (--length <= 0) {
                        state = 9;
                    }
                    break;
                case 9:
                    state = 10;
                    break;
                case 10:
                    System.out.print("Ad : " + data);
                    ad = data;
                    state = 11;
                    break;
                case 11:
                    state = 12;
                    break;
                case 12:
                    System.out.println("Md : " + data);
                    md = data;
                    state = 0;
                    break;
                default:
                    break;
            }
        }
        public void measure(String id, int no){
        	conn();
        	try {
        	    send();
        	} catch (IOException e) {
        	    e.printStackTrace();
        	}
        	try {
        	    mst = new FileOutputStream("C:\\Users\\ccy58\\Desktop\\sample\\뇌파txt파일\\middle.txt");
        	} catch (IOException e1) {
        	    e1.printStackTrace();
        	}
        	ssss = 0;
        	
        	while (true) {
        	    try {
                	recv();
                	if (state == 0) {
        	            write_file(id, no);
                    	ssss++;
                	}
            	} catch (IOException e) {
        	        e.printStackTrace();
        	    }
        	    /*
        	    if(mt.ssss == 300)
        	    {
                	mt.ssss = 0;
                	mt.state = 1;
            	}
             	*/
            	if (ssss == 4) //횟수 정해줘 (2560 * n)
            	{
        	
                	ssss = 0;        //n번 초기화 
                	state = 1;       //상태 초기화
                	//측정 완료된 상태
                	//todo ex) 버튼 상태 조절
                	break;
            	}
        	}
        }
    }