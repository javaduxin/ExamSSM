package com.prj.controller.Menu;

import com.prj.entity.ClassmenuVO;
import com.prj.server.menu.MenuServer;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MenuController {


    @Autowired
    @Qualifier("MenuServerImpl")
    private MenuServer menuServer;

    public MenuServer getMenuServer() {
        return menuServer;
    }

    public void setMenuServer(MenuServer menuServer) {
        this.menuServer = menuServer;
    }

    @ResponseBody
    @RequestMapping("/upload")
    public Map<String,Object> upload(@RequestParam("myfile") MultipartFile myfile, HttpServletRequest request) throws Exception {

        //判断用户是否选择文件
        //isEmpty()判断文件是否为空
        if(!myfile.isEmpty()){
            //获取上传的服务器地址
            String url=request.getSession().getServletContext().getRealPath("/upload/");
            //创建文件对象getOriginalFilename()获取文件名称
            File file=new File(url+myfile.getOriginalFilename());
            //把文件复制到目标地址FileUtils.copyInputStreamToFile(文件对象，目标地址对象)
            FileUtils.copyInputStreamToFile(myfile.getInputStream(),file);
        }
        Map<String,Object> map = new HashMap<String,Object>();
        //返回json
        map.put("msg","ok");
        map.put("code",200);
        return map;
    }


    //添加菜单\
    //@ResponseBody响应json到页面，@RequestBody从页面提交json到后台
    @ResponseBody
    @RequestMapping("/addMenu")
    public String addMenu(@RequestBody ClassmenuVO classmenu){
       int i= menuServer.addMenu(classmenu);

       if(i>0){
           return "ok";
       }

       return "error";
    }
}
