package com.ray.cool.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ray.cool.biz.UserBiz;
import com.ray.cool.entity.User;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by en on 2016/10/23.
 */
@Controller("testAction")
public class TestAction extends ActionSupport {

    @Resource
    private   UserBiz userBiz;
    private  List<User>  users;
    @Override
    public String execute() throws Exception {

        users= userBiz.list();
        return super.execute();

    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
