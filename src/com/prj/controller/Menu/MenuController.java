package com.prj.controller.Menu;

import com.prj.entity.ClassmenuVO;
import com.prj.server.menu.MenuServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
