package com.prj.server.exam;

import com.prj.entity.Exam;
import com.prj.mapper.exam.ExamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("ExamServerImpl")
public class ExamServerImpl implements ExamServer{

    @Autowired
    private ExamMapper examMapper;

    public ExamMapper getExamMapper() {
        return examMapper;
    }

    public void setExamMapper(ExamMapper examMapper) {
        this.examMapper = examMapper;
    }
    //查询考试信息
    @Override
    public List<Exam> queryExam(int mid) {
        return examMapper.queryExam(mid);
    }

    @Override
    public int addExam(Exam exam) {
        return examMapper.addExam(exam);
    }
}
