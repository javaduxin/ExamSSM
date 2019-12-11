package com.prj.server.result;

import com.prj.entity.Result;

import java.util.List;

public interface ResultServer {

    //查询考试结果
    public List<Result> queryResult();

}
