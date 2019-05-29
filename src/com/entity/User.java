package com.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private Integer uid;
    private String uname;
    private String upwd;
    private Integer ustate;
    private String username;
    private String usex;
    private Date udata;

    public Date getUdata() {
        return udata;
    }

    public void setUdata(Date udata) {
        this.udata = udata;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public Integer getUstate() {
        return ustate;
    }

    public void setUstate(Integer ustate) {
        this.ustate = ustate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }


}

