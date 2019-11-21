package com.prj.entity;


public class Menu {

  private long id;
  private String title;
  private String author;
  private int status;
  private String url;
  private String type;
  private java.sql.Timestamp opentime;
  private int ispublic;
  private int istop;
  private int scoreTime;
  private int sumScore;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }


  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }


  public java.sql.Timestamp getOpentime() {
    return opentime;
  }

  public void setOpentime(java.sql.Timestamp opentime) {
    this.opentime = opentime;
  }


  public int getIspublic() {
    return ispublic;
  }

  public void setIspublic(int ispublic) {
    this.ispublic = ispublic;
  }


  public int getIstop() {
    return istop;
  }

  public void setIstop(int istop) {
    this.istop = istop;
  }


  public int getScoreTime() {
    return scoreTime;
  }

  public void setScoreTime(int scoreTime) {
    this.scoreTime = scoreTime;
  }


  public int getSumScore() {
    return sumScore;
  }

  public void setSumScore(int sumScore) {
    this.sumScore = sumScore;
  }

}
