package com.prj.entity;

import java.util.List;

public class ResultVO {
    private Result result;//考试结果
    private List<String> choosex;//提交答案

    public List<String> getChoosex() {
        return choosex;
    }

    public void setChoosex(List<String> choosex) {
        this.choosex = choosex;
    }

    public Result getResult() {
        return result;
    }

    public void setResult(Result result) {
        this.result = result;
    }


}
