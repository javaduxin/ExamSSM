package com.prj.server.menu;

import com.prj.entity.*;
import com.prj.mapper.exam.ExamMapper;
import com.prj.mapper.menu.MenuMapper;
import com.prj.server.exam.ExamServer;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("MenuServerImpl")
public class MenuServerImpl implements MenuServer{


    @Autowired
    private MenuMapper menuMapper;//科目

    @Autowired
    private ExamMapper examMapper;//试题

    public ExamMapper getExamMapper() {
        return examMapper;
    }

    public void setExamMapper(ExamMapper examMapper) {
        this.examMapper = examMapper;
    }

    public MenuMapper getMenuMapper() {
        return menuMapper;
    }

    public void setMenuMapper(MenuMapper menuMapper) {
        this.menuMapper = menuMapper;
    }

    @Override
    public int insertResult(ResultVO resultvo) {

        //获取学生选择的答案
        String daAn="";
        //学生提交的答案
        List<String> choosex=resultvo.getChoosex();

        for(String str:choosex){
            daAn+=str;
        }

        //获取结果对象
        Result result=resultvo.getResult();
        //把整个结果存入答案列
        result.setInfo(daAn);

        //获取当前考试时间
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //把时间转换成字符串
        result.setTime(dateFormat.format(date));

        //查询此次考试正确答案
        List<Exam> examList= menuMapper.queryExamAnswer(result.getMenu().getId());

        //总分数
        int sumScore=0;

        //判卷
        for(int i=0;i<choosex.size();i++){
            //获取当前正确答案
            String answer= examList.get(i).getAnswer();

            if("A".equals(answer)&&choosex.get(i).equals("1")){
                sumScore+=10;
            }else if("B".equals(answer)&&choosex.get(i).equals("2")){
                sumScore+=10;
            }else if("C".equals(answer)&&choosex.get(i).equals("3")){
                sumScore+=10;
            }else if("D".equals(answer)&&choosex.get(i).equals("4")){
                sumScore+=10;
            }

        }
        //最后得分
        result.setResult(sumScore);
        return menuMapper.insertResult(result);
    }

    @Override
    public List<Menu> loadMenu(int id) {
        return menuMapper.loadMenu(id);
    }

    //定时任务修改发布状态
    @Override
    public int updateTimerIsPublic(long mid) {
        return menuMapper.updateTimerIsPublic(mid);
    }

    //添加试题并且添加班级列表
    @Override
    public int addMenu(ClassmenuVO classmenu, File file) throws Exception {

        //生成科目ID
        long mid=System.currentTimeMillis();

        classmenu.getMenu().setId(mid);

        //试题对象
        Menu menux=classmenu.getMenu();
        //判断是否是定时发布
        if(menux.getIspublic()==0){
            //把字符串转换成java.sql.Timestamp
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date date = null;
            try {
                date = sf.parse(classmenu.getMytime());
            } catch (Exception e) {
                e.printStackTrace();
            }
            java.sql.Timestamp dateSQL = new java.sql.Timestamp(date.getTime());

            menux.setOpentime(dateSQL);
        }



        //添加科目
        int i=menuMapper.addMenu(menux);

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
            //=====读取excel开始====

            //新式题集合
            List<Exam> examList=new ArrayList<Exam>();
            //读取文件信息
            XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(file));
            // 读取第一章表格内容
            XSSFSheet sheet = xwb.getSheetAt(0);
            // 定义 row、cell
            XSSFRow row;
            String cell;
            // 循环输出表格中的内容
            //循环行
            for (int x = sheet.getFirstRowNum()+1; x < sheet.getPhysicalNumberOfRows(); x++) {

                //新试题对象
                Exam exam=new Exam();
                //A B C D选择
                String info="";

                row = sheet.getRow(x);
                //循环列
                for (int z = row.getFirstCellNum(); z < row.getPhysicalNumberOfCells(); z++) {


                    // 通过 row.getCell(j).toString() 获取单元格内容，
                    if(row.getCell(z)!=null){
                        cell = row.getCell(z).toString();
                        //读取excel文件中的列插入集合中
                        switch (z){
                            case 0://试题小标题
                                exam.setTitle(cell);
                                break;
                            case 1://一下是abcd选项
                                info+=(cell);
                                break;
                            case 2:
                                info+=("~"+cell);
                                break;
                            case 3:
                                info+=("~"+cell);
                                break;
                            case 4:
                                info+=("~"+cell);
                                exam.setInfo(info);
                                break;
                            case 5://正确答案
                                exam.setAnswer(cell);
                                break;
                        }

                        //System.out.print(cell + "\t");
                    }
                }
                examList.add(exam);
            }
            //=====读取excel结束====

            //循环添加试题
            for(int index=0;index<examList.size();index++){

                Menu menu=new Menu();
                menu.setId(mid);//指定mid科目外键
                examList.get(index).setMenu(menu);

                examMapper.addExam(examList.get(index));
            }


        }
        return i;
    }

    @Override
    public int addMenuClasses(Classmenu classesmenu) {
        return menuMapper.addMenuClasses(classesmenu);
    }

    @Override
    public List<Menu> queryMenu(String title,User user) {

        return menuMapper.queryMenu(title,user);
    }

    @Override
    public int updateIsTop(long id, int istop) {
        return menuMapper.updateIsTop(id, istop);
    }

    @Override
    public int delMenu(Long[] ids) {
        return menuMapper.delMenu(ids);
    }
}
