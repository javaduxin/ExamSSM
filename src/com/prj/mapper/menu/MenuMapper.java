package com.prj.mapper.menu;

import com.prj.entity.Classmenu;
import com.prj.entity.Menu;

import java.util.List;

//科目
public interface MenuMapper {


    //查询考试科目
    public List<Menu> queryMenu();

    //添加科目
    public int addMenu(Menu menu);

    //添加科目表与班级表中间表
    public int addMenuClasses(Classmenu classesmenu);
}
