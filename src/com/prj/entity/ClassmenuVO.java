package com.prj.entity;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;
//临时实体类
public class ClassmenuVO {

    private Menu menu;//试题对象一个对象
    private List<Classes> classesList;//添加过程中有多个班级

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public List<Classes> getClassesList() {
        return classesList;
    }

    public void setClassesList(List<Classes> classesList) {
        this.classesList = classesList;
    }
}
