package com.prj.mapper.menu;

import com.prj.entity.Classmenu;
import com.prj.entity.Menu;
import com.prj.entity.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//科目
public interface MenuMapper {

    //交卷
    public int insertResult(Result result);


    //加载登录人考试列表
    public List<Menu> loadMenu(@Param("id") int id);


    //定时任务修改发布状态
    public int updateTimerIsPublic(@Param("mid")long mid);

    //查询考试科目
    public List<Menu> queryMenu(@Param("title") String title);

    //添加科目
    public int addMenu(Menu menu);

    //添加科目表与班级表中间表
    public int addMenuClasses(Classmenu classesmenu);

    //修改置顶
    public int updateIsTop(@Param("id") long id,@Param("istop") int istop);

    //批量删除
    public int delMenu(@Param("ids") Long[] ids);

}
