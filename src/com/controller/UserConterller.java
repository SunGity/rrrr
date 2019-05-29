package com.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSONArray;
import com.entity.User;
import com.service.UserService;

@Controller
@SessionAttributes(value = {"uname"}, types = {User.class})
public class UserConterller {
    @Autowired
    private UserService userService;

    /*@RequestMapping(value="longin",method=RequestMethod.POST)
    public String test(String name,String pwd,Model model){
        User user=userService.findUserByNameAndPwd(name, pwd);
        model.addAttribute("user",user);
        if(user!=null){
                return "redirect:fenye";
        }else{
            return "longin";
        }


    }*/
    @ResponseBody
    @RequestMapping(value = "longin", method = RequestMethod.POST)
    public Object test(String uname, String upwd, Model model) {
        User user = userService.findUserByNameAndPwd(uname, upwd);
        if (user != null) {
            model.addAttribute("uname", uname);
            model.addAttribute("user", user);
            return JSONArray.toJSONString(user);
        }

        return "longin";


    }

    @RequestMapping(value = "fenye", method = RequestMethod.GET)
    public String testFenye(Integer pageNo, Model model) {
        if (pageNo == null) {
            pageNo = 1;
        }
        Integer pageSize = 3;
        Integer qishi = (pageNo - 1) * pageSize;
        int count = userService.countSelect();
        int totalpage = count % pageSize == 0 ?
                count / pageSize :
                (count / pageSize) + 1;
        List<User> u = userService.findUserSelect(pageSize, qishi);

        model.addAttribute("u", u);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("totalpage", totalpage);
        return "success";


    }

    @ResponseBody
    @RequestMapping(value = "All", method = RequestMethod.GET)
    public Object testAll(Model model) {
        List<User> u = userService.findUserAll();
        model.addAttribute("u", u);
        return JSONArray.toJSONString(u);
    }

    @ResponseBody
    @RequestMapping(value = "zc", method = RequestMethod.POST)
    public String testZhuce(String uname, User user, Model model) {
        User u = userService.findUserByName(uname);
        Date data = new Date();
        user.setUdata(data);
        if (u == null) {
            int li = userService.findUser(user);
            /*model.addAttribute("user",user);*/
            if (li > 0) {
                return "1";
            }
        }

        return "0";

    }

    @ResponseBody
    @RequestMapping(value = "selectupdate", method = RequestMethod.GET)
    public String testSelectupdate(int uid, Model model) {
        User user = userService.findById(uid);
        model.addAttribute("user", user);
        return JSONArray.toJSONString(user);

    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String testupdate(String uname, User user, Model model) {
        Date data = new Date();
        user.setUdata(data);
        User u = userService.findUserByName(uname);
        if (u == null) {
            int i = userService.update(user);
            if (i > 0) {
                return "1";
            }
        }


        return "0";

    }

    @ResponseBody
    @RequestMapping(value = "del", method = RequestMethod.GET)
    public String testdelete(int uid, Model model) {
        int i = userService.delete(uid);

        if (i > 0) {
            return "1";
        }

        return "0";

    }

    @ResponseBody
    @RequestMapping(value = "piliang", method = RequestMethod.GET)
    public Object testdeletepl(int[] uid, Model model) {
        int i = userService.deletepl(uid);

        if (i > 0) {
            return "1";
        }


        return "0";

    }
}
