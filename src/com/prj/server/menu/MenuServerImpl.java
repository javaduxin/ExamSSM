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
import java.util.ArrayList;
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

    //添加试题并且添加班级列表
    @Override
    public int addMenu(ClassmenuVO classmenu, File file) throws Exception {

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
    public List<Menu> queryMenu() {
        return menuMapper.queryMenu();
    }

    @Override
    public int updateIsTop(long id, int istop) {
        return menuMapper.updateIsTop(id, istop);
    }
}
