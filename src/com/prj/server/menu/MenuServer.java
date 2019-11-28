package com.prj.server.menu;

import com.prj.entity.Classmenu;
import com.prj.entity.ClassmenuVO;
import com.prj.entity.Menu;

import java.io.File;
import java.util.List;


public interface MenuServer {


    //添加科目
    public int addMenu(ClassmenuVO classmenu, File file)throws Exception;

    //添加科目表与班级表中间表
    public int addMenuClasses(Classmenu classesmenu);

    //查询考试科目
    public List<Menu> queryMenu();

}
