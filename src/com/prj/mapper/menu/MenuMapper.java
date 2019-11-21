package com.prj.mapper.menu;

import com.prj.entity.Classmenu;
import com.prj.entity.Menu;

//科目
public interface MenuMapper {

    //添加科目
    public int addMenu(Menu menu);

    //添加科目表与班级表中间表
    public int addMenuClasses(Classmenu classesmenu);
}
