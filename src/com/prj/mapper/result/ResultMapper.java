package com.prj.mapper.result;

import com.prj.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//科目
public interface ResultMapper {

    //查询考试结果
    public List<Result> queryResult();



}
