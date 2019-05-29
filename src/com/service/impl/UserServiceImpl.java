package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao ud;

    @Override
    public User findUserByNameAndPwd(String uname, String upwd) {
        // TODO Auto-generated method stub
        return ud.findUserByNameAndPwd(uname, upwd);
    }

    @Override
    public int findUser(User user) {
        // TODO Auto-generated method stub
        return ud.findUser(user);
    }

    @Override
    public List<User> findUserSelect(Integer pageSize, Integer qishi) {
        // TODO Auto-generated method stub
        return ud.findUserSelect(pageSize, qishi);
    }

    @Override
    public int countSelect() {
        // TODO Auto-generated method stub
        return ud.countSelect();
    }

    @Override
    public User findById(int uid) {
        // TODO Auto-generated method stub
        return ud.findById(uid);
    }

    @Override
    public int update(User user) {
        // TODO Auto-generated method stub
        return ud.update(user);
    }

    @Override
    public int delete(int uid) {
        // TODO Auto-generated method stub
        return ud.delete(uid);
    }

    @Override
    public int deletepl(int[] uid) {
        // TODO Auto-generated method stub
        return ud.deletepl(uid);
    }

    @Override
    public List<User> findUserAll() {
        // TODO Auto-generated method stub
        return ud.findUserAll();
    }

    @Override
    public User findUserByName(String uname) {
        // TODO Auto-generated method stub
        return ud.findUserByName(uname);
    }

}
