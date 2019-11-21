package com.prj.server.menu;

import com.prj.entity.Classmenu;
import com.prj.entity.ClassmenuVO;
import com.prj.mapper.menu.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MenuServerImpl")
public class MenuServerImpl implements MenuServer{


    @Autowired
    private MenuMapper menuMapper;

    public MenuMapper getMenuMapper() {
        return menuMapper;
    }

    public void setMenuMapper(MenuMapper menuMapper) {
        this.menuMapper = menuMapper;
    }

    @Override
    public int addMenu(ClassmenuVO classmenu) {

        //生成科目ID
        long mid=System.currentTimeMillis();

        classmenu.getMenu().setId(mid);
        //添加科目
        int i=menuMapper.addMenu(classmenu.getMenu());
        if(i>0){
            //科目表添加成功
            //Classmenu classmenu=new Classmenu();
            //添加科目表
            //classmenu.setMenuid(mid);
            //添加班级表
            //classmenu.setClassid(classes.getId());

            //this.addMenuClasses(classmenu);

        }
        return i;
    }

    @Override
    public int addMenuClasses(Classmenu classesmenu) {
        return menuMapper.addMenuClasses(classesmenu);
    }
}
