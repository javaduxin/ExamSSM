package com.prj.controller.result;

import com.prj.entity.Result;
import com.prj.server.result.ResultServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

@Controller
public class ResultController {

    @Autowired
    @Qualifier("ResultServerImpl")
    private ResultServer resultServer;

    public ResultServer getResultServer() {
        return resultServer;
    }

    public void setResultServer(ResultServer resultServer) {
        this.resultServer = resultServer;
    }

    @ResponseBody
    @RequestMapping("/queryResult")
    public Map<String,Object> queryResult(){

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("data", resultServer.queryResult());
        return map;
    }



}
