package com.prj.server.user;

import com.prj.entity.Classmenu;
import com.prj.entity.ClassmenuVO;
import com.prj.entity.User;

import java.io.File;


public interface UserServer {


    //登录
    public User login(User user);

    //添加用户
    public int addUser(User user);

    //修改密码
    public int updatePwd(int id,  String newpwd);

    //上传头像
    public int userUpload(String url,int uid);
}
