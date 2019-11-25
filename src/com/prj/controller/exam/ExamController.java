package com.prj.controller.exam;

import com.prj.entity.Exam;
import com.prj.server.exam.ExamServerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ExamController {

    @Autowired
    @Qualifier("ExamServerImpl")
    private ExamServerImpl examServer;

    public ExamServerImpl getExamServer() {
        return examServer;
    }

    public void setExamServer(ExamServerImpl examServer) {
        this.examServer = examServer;
    }


    //查询考试
    @ResponseBody
    @RequestMapping("/queryExam/{mid}")
    public List<Exam> queryExam(@PathVariable long mid){
        return examServer.queryExam(mid);
    }


}
