package com.prj.server.exam;

import com.prj.entity.Exam;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExamServer {
    //查询考试
    public List<Exam> queryExam(@Param("mid") long mid);
    //添加试题信息
    public int addExam(Exam exam);
}
