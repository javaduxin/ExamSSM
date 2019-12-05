package com.prj.entity;


public class Result {

  private int id;
  private User user;
  private String title;
  private int result;
  private String time;
  private Menu menu;
  private String info;


  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Menu getMenu() {
    return menu;
  }

  public void setMenu(Menu menu) {
    this.menu = menu;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public int getResult() {
    return result;
  }

  public void setResult(int result) {
    this.result = result;
  }


  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }





  public String getInfo() {
    return info;
  }

  public void setInfo(String info) {
    this.info = info;
  }

}
