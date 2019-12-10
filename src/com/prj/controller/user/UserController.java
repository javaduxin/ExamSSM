package com.prj.controller.user;

import com.prj.entity.Classes;
import com.prj.entity.Role;
import com.prj.entity.User;
import com.prj.server.user.UserServer;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Random;

@Controller
public class UserController {

    @Autowired
    @Qualifier("UserServerImpl")
    private UserServer userServer;

    public UserServer getUserServer() {
        return userServer;
    }

    public void setUserServer(UserServer userServer) {
        this.userServer = userServer;
    }

    //验证码随机内容
    private char[] codeSequence = { 'A', '1','B', 'C', '2','D','3', 'E','4', 'F', '5','G','6', 'H', '7','I', '8','J',
            'K',   '9' ,'L', '1','M',  '2','N',  'P', '3', 'Q', '4', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z'};


    //验证码
    String strCode="";


    //登录
    @ResponseBody
    @RequestMapping("/login")
    public String login(User user,HttpSession session,String yzm){
        //提交的密码也进行md5加密
        user.setPwd(string2MD5(user.getPwd()));

        User loginUser= userServer.login(user);
        //strCode自己生成的验证码，yzm用户提交的验证码
        if(loginUser!=null&&yzm.equals(strCode)){

            //登录成功把用户信息存入session
            session.setAttribute("loginUser",loginUser);
            return "ok";
        }

        return "pwderror";
    }




    //验证码
    @RequestMapping("/code")
    public void getCode(HttpServletResponse response, HttpSession session) throws IOException {
        int width = 63;
        int height = 37;
        Random random = new Random();
        //设置response头信息
        //禁止缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //生成缓冲区image类
        BufferedImage image = new BufferedImage(width, height, 1);
        //产生image类的Graphics用于绘制操作
        Graphics g = image.getGraphics();
        //Graphics类的样式
        g.setColor(this.getColor(200, 250));
        g.setFont(new Font("Times New Roman",0,28));
        g.fillRect(0, 0, width, height);
        //绘制干扰线
        for(int i=0;i<40;i++){
            g.setColor(this.getColor(130, 200));
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(12);
            int y1 = random.nextInt(12);
            g.drawLine(x, y, x + x1, y + y1);
        }

        //绘制字符
        String strCode = "";
        for(int i=0;i<4;i++){
            String rand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);
            strCode = strCode + rand;
            g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
            g.drawString(rand, 13*i+6, 28);
        }
        //将字符保存到session中用于前端的验证
        //session.setAttribute("authCode", strCode.toLowerCase());
        //给验证码赋值
        this.strCode=strCode;

        g.dispose();

        ImageIO.write(image, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();
    }

    public  Color getColor(int fc,int bc){
        Random random = new Random();
        if(fc>255)
            fc = 255;
        if(bc>255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r,g,b);
    }



    //添加用户
    @ResponseBody
    @RequestMapping("/addUser")
    public String addUser(User user){
        //对密码进行md5加密
        //添加用户初始密码是123
        user.setPwd(string2MD5("123"));

        userServer.addUser(user);

        return "ok";
    }


    /***
     * MD5加码 生成32位md5码
     */
    public static String string2MD5(String inStr){
        try {
            // 生成一个MD5加密计算摘要
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 计算md5函数
            md.update(inStr.getBytes());
            // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
            // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
            return new BigInteger(md.digest()).toString(16);
        } catch (Exception e) {
            return null;
        }
    }


    //修改密码
    @ResponseBody
    @RequestMapping("/updatePwd")
    public String updatePwd(int id, String newPwd, String oldPwd, HttpSession session){

        User user=(User)session.getAttribute("loginUser");
        //判断提交过来的旧密码与登录密码是否一致
        if(string2MD5(oldPwd).equals(user.getPwd())){
           //执行修改密码
            userServer.updatePwd(user.getId(),string2MD5(newPwd));

            return "修改密码成功！";
        }else {
            return "旧密码错误，请重新输入！";
        }



    }


}



