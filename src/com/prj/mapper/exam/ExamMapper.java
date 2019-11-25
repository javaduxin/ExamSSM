package com.prj.mapper.exam;

import com.prj.entity.Exam;
import com.prj.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExamMapper {

    //查询考试
    public List<Exam> queryExam(@Param("mid") int mid);

    //添加试题信息
    public int addExam(Exam exam);


}
