package servlet;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Markdown实现图片上传Servlet类
 */

@WebServlet(name = "ImageUploadServlet", urlPatterns = "/servlet/ImageUploadServlet")
public class ImageUploadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码格式
        req.setCharacterEncoding("UTF-8");

        //实例化SmartUpload对象
        SmartUpload smu = new SmartUpload();

        //获取路径
        String rootPath = req.getSession().getServletContext().getRealPath("/resources/upload/pic");
        java.io.File filePath = new java.io.File(rootPath);

        //判断路径文件夹是否存在
        if(!filePath.exists()){
            filePath.mkdirs();   //创建文件目录
        }

        try {
            //初始化上传操作
            smu.initialize(this.getServletConfig(), req, resp);
            smu.setCharset("utf-8");
            smu.setAllowedFilesList("gif,jpg,png,bmp");
            smu.setMaxFileSize(200*1024);

            //上传准备
            smu.upload();

            for(int i = 0; i < smu.getFiles().getCount(); i++){
                SmartFile file = smu.getFiles().getFile(i);
                java.io.File realfile = new java.io.File(rootPath+"/"+file.getFileName());
                file.saveAs(realfile.toString());
                String path = req.getContextPath();
                String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";

                //返回json串  url作为图片的地址
                resp.getWriter().write("{\"success\":1,\"messgae\":\"upload successful\",\"url\":\""+basePath+"resources/upload/pic/"+file.getFilePathName()+"\"}");
            }
        } catch (SmartUploadException e) {
            resp.getWriter().write("{\"success\":0}");
            e.printStackTrace();
        }
    }
}
