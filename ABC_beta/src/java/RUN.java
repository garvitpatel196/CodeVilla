
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.concurrent.TimeUnit;

class RUN {

    public String compilecpp(String filename, String str, String str1) throws IOException {
        FileWriter fstream_inp_Cpp = new FileWriter("inputsCpp.txt", true);
        try (BufferedWriter out1 = new BufferedWriter(fstream_inp_Cpp)) {
            out1.write(str1);

            out1.close();
        } catch (Exception e) {
            System.out.println("error");
        }
        File fileCpp = new File(filename + ".cpp");
        //coping content of code to file
        FileWriter fstreamCpp = new FileWriter(fileCpp, true);
        try (BufferedWriter out1 = new BufferedWriter(fstreamCpp)) {
            out1.write(str);

            out1.close();

            //compiling
            String ans = runProcess("g++ -o " + filename + " " + filename + ".cpp");
            Thread.sleep(100);
            System.out.println("ans=" + ans);
            //running
            if (ans.equals("")) {
                File filec = new File(filename + ".exe");
                if (filec.exists()) {
                    String[] command = new String[3];
                    command[0] = "cmd";
                    command[1] = "/c";
                    command[2] = filename + ".exe" + " < " + "inputsCpp.txt";
                    Process p = Runtime.getRuntime().exec(command);
                    p.waitFor(5, TimeUnit.SECONDS);
                    if (p.isAlive()) {

                        Process p2 = Runtime.getRuntime().exec("Taskkill /IM " + filename + ".exe /F");
                        if (fileCpp.exists()) {
                            fileCpp.delete();
                        }
                        //deleting .o file
                        File fileO = new File(filename + ".o");
                        if (fileO.exists()) {
                            fileO.delete();
                        }
                        //deleting .exe file
                        File fileexe = new File(filename + ".exe");
                        if (fileexe.exists()) {
                            fileexe.delete();
                        }
                        //deleting input file
                        File file4 = new File("inputsCpp.txt");
                        if (file4.exists()) {
                            file4.delete();
                        }
                        return "Time Limit Exceed";
                    }
                    String output = printLines(p.getInputStream());
                    String error = printLines(p.getErrorStream());
                    output = check(output, filename);
                    if (fileCpp.exists()) {
                        fileCpp.delete();
                    }
                    //deleting .o file
                    File fileO = new File(filename + ".o");
                    if (fileO.exists()) {
                        fileO.delete();
                    }
                    //deleting .exe file
                    File fileexe = new File(filename + ".exe");
                    if (fileexe.exists()) {
                        fileexe.delete();
                    }
                    //deleting input file
                    File file4 = new File("inputsCpp.txt");
                    if (file4.exists()) {
                        file4.delete();
                    }
                    if (output.equals("")) {
                        return "Run Time Error";
                    } else {
                        return output;
                    }
                }
            } else {
                if (fileCpp.exists()) {
                    fileCpp.delete();
                }
                //deleting .o file
                File fileO = new File(filename + ".o");
                if (fileO.exists()) {
                    fileO.delete();
                }
                //deleting .exe file
                File fileexe = new File(filename + ".exe");
                if (fileexe.exists()) {
                    fileexe.delete();
                }
                //deleting input file
                File file4 = new File("inputsCpp.txt");
                if (file4.exists()) {
                    file4.delete();
                }
                return "Compile-Time Error";
            }
        } catch (Exception e) {
            System.out.println(e + "</br>");
        }
        return "ERROR";
    }

    public String compilec(String filename, String str, String str1) throws IOException {
        //coping contents of input to a file

        FileWriter fstream_inp_C = new FileWriter("Admininputsc.txt", true);

        try (BufferedWriter out1 = new BufferedWriter(fstream_inp_C)) {
            out1.write(str1);

            out1.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        File fileC = new File(filename + ".c");
        //coping content of code to file
        FileWriter fstreamC = new FileWriter(fileC, true);
        try (BufferedWriter out1 = new BufferedWriter(fstreamC)) {
            out1.write(str);
            out1.close();
            Thread.sleep(10);

            //compiling
            String ans = runProcess("gcc " + filename + ".c -o " + filename);
            //running
            if (ans.equals("")) {
                File filec = new File(filename + ".exe");
                if (filec.exists()) {
                    String[] command = new String[3];
                    command[0] = "cmd";
                    command[1] = "/c";
                    command[2] = filename + ".exe" + " < " + "I:\\new\\Admininputsc.txt";
                    Process p = Runtime.getRuntime().exec(command);
                    p.waitFor(5, TimeUnit.SECONDS);
                    if (p.isAlive()) {
                        System.out.println("Hello");
                        Process p2 = Runtime.getRuntime().exec("Taskkill /IM " + filename + ".exe /F");
                        if (fileC.exists()) {
                            fileC.delete();
                        }
                        //deleting .o file
                        File fileO = new File(filename + ".o");
                        if (fileO.exists()) {
                            fileO.delete();
                        }
                        //deleting .exe file
                        File fileexe = new File(filename + ".exe");
                        if (fileexe.exists()) {
                            fileexe.delete();
                        }
                        //deleting input file
                        File file4 = new File("inputsC.txt");
                        if (file4.exists()) {
                            file4.delete();
                        }
                        return "Time Limit Exceed";
                    }
                    String output = printLines(p.getInputStream());
                    String error = printLines(p.getErrorStream());

                    output = check(output, filename);
                    //deleting .c file
                    if (fileC.exists()) {
                        fileC.delete();
                    }
                    //deleting .o file
                    File fileO = new File(filename + ".o");
                    if (fileO.exists()) {
                        fileO.delete();
                    }
                    //deleting .exe file
                    File fileexe = new File(filename + ".exe");
                    if (fileexe.exists()) {
                        fileexe.delete();
                    }
                    //deleting input file
                    File file4 = new File("inputsC.txt");
                    if (file4.exists()) {
                        file4.delete();
                    }
                    if (output.equals("")) {
                        return "Run Time Error";
                    } else {
                        return output;
                    }
                }

            } else {
                if (fileC.exists()) {
                    fileC.delete();
                }
                //deleting .o file
                File fileO = new File(filename + ".o");
                if (fileO.exists()) {
                    fileO.delete();
                }
                //deleting .exe file
                File fileexe = new File(filename + ".exe");
                if (fileexe.exists()) {
                    fileexe.delete();
                }
                //deleting input file
                File file4 = new File("inputsC.txt");
                if (file4.exists()) {
                    file4.delete();
                }
                return "Compile-Time Error";
            }
        } catch (Exception e) {
            System.out.print(e + "</br>");
        }

        return "ERROR";
    }

    public String compilejava(String filename, String str, String str1) throws IOException {
        File file1 = new File("inputsJAVA.txt");
        File file2 = new File(filename + ".class");
        FileWriter fstream1 = new FileWriter(file1, true);
        try (BufferedWriter out1 = new BufferedWriter(fstream1)) {
            out1.write(str1);
            out1.close();
        } catch (Exception e) {
            System.out.println("error");
        }
        //code content copying to file 
        File file = new File(filename + ".java");
        if (file.exists()) {
            file.delete();
        }
        FileWriter fstream = new FileWriter(file, true);
        try (BufferedWriter out1 = new BufferedWriter(fstream)) {
            out1.write(str);
            out1.close();
            //compiling
            String ans = runProcess("javac -cp src *.java");
            Thread.sleep(100);
            if (ans.equals("")) {
                File filec = new File(filename + ".class");
                if (filec.exists()) {
                    String[] command = new String[3];
                    command[0] = "cmd";
                    command[1] = "/c";
                    command[2] = "java " + filename + " < " + "inputsJAVA.txt";
                    Process p = Runtime.getRuntime().exec(command);
                    p.waitFor(2, TimeUnit.SECONDS);
                    if (p.isAlive()) {
                        System.out.println("HELLO");
                        p.destroyForcibly();
                        if (file2.exists()) {
                            file2.delete();
                        }
                        //input file deleteing
                        if (file1.exists()) {
                            file1.delete();
                        }
                        return "Execution Time Exceed";
                    }
                    Thread.sleep(100);

                    String output = printLines(p.getInputStream());
                    String error = printLines(p.getErrorStream());
                    if (output.equals("")) {
                        if (file2.exists()) {
                            file2.delete();
                        }
                        //input file deleteing
                        if (file1.exists()) {
                            file1.delete();
                        }
                        return "Run-Time Error";
                    } else {
                        if (file2.exists()) {
                            file2.delete();
                        }
                        //input file deleteing
                        if (file1.exists()) {
                            file1.delete();
                        }
                        output = check(output, filename);
                        return output;
                    }

                } else {
                }
            } else {
                return "Compile-Time Error";
            }
        } catch (Exception e) {
            return "ERROR";
        }
        return "ERROR";
    }

    private String printLines(InputStream ins) throws Exception {
        String line;
        BufferedReader in = new BufferedReader(
                new InputStreamReader(ins));
        String ss = new String();
        int i = 0;
        while ((line = in.readLine()) != null) {
            if (i == 0) {
                ss = ss + line;
                i++;
            } else {
                ss = ss + System.lineSeparator() + line;
            }
        }

        return ss;
    }

    private String runProcess(String command) throws Exception {
        Process pro = Runtime.getRuntime().exec(command);
        pro.waitFor(2000, TimeUnit.SECONDS);
        if (pro.isAlive()) {
            pro.destroyForcibly();
        }
        System.out.println(pro.getInputStream());
        return printLines(pro.getErrorStream());
    }

    private String check(String output, String filename) throws IOException {
        File outputfile = new File(filename + "output.txt");
        File Adminoutput = new File("I:\\new\\Adminoutput.txt");
        if (outputfile.exists()) {
            outputfile.delete();
        }
        FileWriter fstream2 = new FileWriter(outputfile, true);
        try (BufferedWriter out2 = new BufferedWriter(fstream2)) {
            out2.write(output);
            out2.close();
        } catch (Exception e) {
            System.out.println("error:" + e);
        }
        String ans = "";
        String tc = "";
        try (FileReader fstream = new FileReader(outputfile)) {
            int i;
            while ((i = fstream.read()) != -1) {
                ans = ans + (char) i;
            }
            fstream.close();
        }

        try (FileReader fstream1 = new FileReader(Adminoutput)) {
            int i;

            while ((i = fstream1.read()) != -1) {
                tc = tc + (char) i;
            }
            fstream1.close();
        }
        //return ans;
        if (tc.equals(ans)) {
            return "Passed";
        } else {
            return "Failed";
        }
    }
}
