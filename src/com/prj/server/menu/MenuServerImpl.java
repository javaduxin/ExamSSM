package com.prj.server.menu;

import com.prj.entity.Classes;
import com.prj.entity.Classmenu;
import com.prj.entity.ClassmenuVO;
import com.prj.entity.Menu;
import com.prj.mapper.menu.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    //添加试题并且添加班级列表
    @Override
    public int addMenu(ClassmenuVO classmenu) {

        //生成科目ID
        long mid=System.currentTimeMillis();

        classmenu.getMenu().setId(mid);
        //添加科目
        int i=menuMapper.addMenu(classmenu.getMenu());

        if(i>0){
            //科目表添加成功,获得多个班级
            List<Classes> classes=classmenu.getClassesList();
            //添加科目表科目表与班级表中间表
            //中间表
            Classmenu classmenu1=new Classmenu();

            for(int j=0;j<classes.size();j++){
                //科目
                Menu menu=new Menu();
                menu.setId(mid);
                //班级
                Classes classes1=classes.get(j);

                classmenu1.setMenu(menu);
                classmenu1.setClasses(classes1);
                //向数据库添加中间表信息
                this.addMenuClasses(classmenu1);
            }
        }
        return i;
    }

    @Override
    public int addMenuClasses(Classmenu classesmenu) {
        return menuMapper.addMenuClasses(classesmenu);
    }
}
