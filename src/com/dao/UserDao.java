package com.dao;

import java.util.List;

import com.entity.User;

public interface UserDao {
    public User findUserByNameAndPwd(String uname, String upwd);

    public User findUserByName(String uname);

    public int findUser(User user);

    public List<User> findUserSelect(Integer pageSize, Integer qishi);

    public List<User> findUserAll();

    public int countSelect();

    public User findById(int uid);

    public int update(User user);

    public int delete(int uid);

    public int deletepl(int[] uid);
}
