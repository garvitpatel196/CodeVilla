
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.SingleThreadModel;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class compile_nd_run extends HttpServlet implements SingleThreadModel{

    static int flag = 0;

    @Override
    @SuppressWarnings("empty-statement")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out;
        out = response.getWriter();
        String str = request.getParameter("code");
        String str1 = request.getParameter("inputs");
        String prglan = request.getParameter("prglan");
        String filename = request.getParameter("filename");
        RUN r = new RUN();
        String ans;
        switch (prglan) {
            case "java":
                while (flag != 0);
                flag = 1;
                //input content copying to fil
                ans = r.compilejava(filename, str, str1);
                out.print(ans);
                flag = 0;
                break;

            case "c":
                while (flag != 0);
                flag = 1;
                ans = r.compilec(filename, str, str1);
                out.print(ans);
                flag = 0;
                break;
            case "cpp":
                while (flag != 0);
                flag = 1;
                //coping contents of input to a file
                ans = r.compilecpp(filename, str, str1);
                out.print(ans);
                flag = 0;
                break;
        }
    }
}
