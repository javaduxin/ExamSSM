package com.prj.server.menu;

import com.prj.entity.*;

import java.io.File;
import java.util.List;


public interface MenuServer {


    ////查询考试答案
    public List<Exam> queryExamAnswer(long mid);

    //交卷
    public int insertResult(ResultVO resultVO);

    //加载登录人考试列表
    public List<Menu> loadMenu(int id);

    //定时任务修改发布状态
    public int updateTimerIsPublic(long mid);

    //添加科目
    public int addMenu(ClassmenuVO classmenu, File file)throws Exception;

    //添加科目表与班级表中间表
    public int addMenuClasses(Classmenu classesmenu);

    //查询考试科目
    public List<Menu> queryMenu(String title,User user);
    //修改置顶
    public int updateIsTop(long id,int istop);

    //批量删除
    public int delMenu(Long[] ids);
}
