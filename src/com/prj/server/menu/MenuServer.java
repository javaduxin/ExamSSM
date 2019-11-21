package com.prj.server.menu;

import com.prj.entity.Classmenu;
import com.prj.entity.ClassmenuVO;


public interface MenuServer {


    //添加科目
    public int addMenu(ClassmenuVO classmenu);

    //添加科目表与班级表中间表
    public int addMenuClasses(Classmenu classesmenu);
}
