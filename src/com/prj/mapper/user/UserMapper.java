package com.prj.mapper.user;

import com.prj.entity.Classmenu;
import com.prj.entity.Menu;
import com.prj.entity.User;

//科目
public interface UserMapper {

    //登录
    public User login(User user);
}
