
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Garvit Patel
 */
public class temp {

    public static void main(String[] args) throws IOException {
        String addCode = "<script>"
                + "document.getElementById('ques_name').innerHTML='Garvit';"
                + "document.getElementById('ques_desc').innerHTML='Patel';"
                + "</script></body></html>";
        try (RandomAccessFile f = new RandomAccessFile(new File("C:\\Users\\Garvit Patel\\Documents\\NetBeansProjects\\ABC_beta\\build\\web\\temp.html"), "rw")) {
            System.out.println(f.length());
            f.seek(22579); // this basically reads n bytes in the file
            f.write(addCode.getBytes());
            f.close();
        }
//        File file1 = new File("C:\\Users\\Garvit Patel\\Documents\\NetBeansProjects\\ABC_beta\\build\\web\\temp.html");
//        FileWriter fstreamC = new FileWriter(file1, true);  
//        String dynamicCode="<script>";
//        try (BufferedWriter out1 = new BufferedWriter(fstreamC)) {
//            out1.write("hello");
//            //out1.write("helloGarvit",0,0);
//            //out1.write(dynamicCode);
//            out1.flush();
//            out1.close();
//        }catch(IOException e){
//            System.out.println(e);
//        }
    }
}
