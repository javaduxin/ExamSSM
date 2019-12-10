package com.prj.mapper.user;

import com.prj.entity.Classmenu;
import com.prj.entity.Menu;
import com.prj.entity.User;
import org.apache.ibatis.annotations.Param;

//科目
public interface UserMapper {

    //添加用户
    public int addUser(User user);

    //修改密码
    public int updatePwd(@Param("id") int id,@Param("newpwd")  String newpwd);

    //登录
    public User login(User user);

    //上传头像
    public int userUpload(@Param("url") String url,@Param("uid") int uid);

}
