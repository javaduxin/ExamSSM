package com.prj.server.result;

import com.prj.entity.Result;
import com.prj.mapper.result.ResultMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ResultServerImpl")
public class ResultServerImpl implements ResultServer {

    @Autowired
    private ResultMapper resultMapper;

    public ResultMapper getResultMapper() {
        return resultMapper;
    }

    public void setResultMapper(ResultMapper resultMapper) {
        this.resultMapper = resultMapper;
    }

    @Override
    public List<Result> queryResult() {
        return resultMapper.queryResult();
    }
}
