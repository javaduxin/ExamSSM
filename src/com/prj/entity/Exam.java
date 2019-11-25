package com.prj.entity;


public class Exam {

  private int id;
  private String title;
  private String info;
  private String answer;
  private long mid;
  private String imgUrl;

  public long getMid() {
    return mid;
  }

  public void setMid(long mid) {
    this.mid = mid;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public String getInfo() {
    return info;
  }

  public void setInfo(String info) {
    this.info = info;
  }


  public String getAnswer() {
    return answer;
  }

  public void setAnswer(String answer) {
    this.answer = answer;
  }





  public String getImgUrl() {
    return imgUrl;
  }

  public void setImgUrl(String imgUrl) {
    this.imgUrl = imgUrl;
  }

}
