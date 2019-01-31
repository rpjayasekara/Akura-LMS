package com.lms.service;

import com.lms.dao.TokenDao;
import com.lms.dao.UserDao;
import com.lms.entity.User;
import com.lms.entity.UserVerfToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Autowired
    TokenDao tokenDao;

    /**
     *
     * @param sjsuid
     * @param useremail
     * @param password
     * @return
     */
    @Override
    public User createUser(long sjsuid, String useremail, String password) {
        User user = new User();

        user.setSjsuid(sjsuid);
        user.setUseremail(useremail);
        user.setPassword(password);
        String role = (useremail.endsWith("@cse.mrt.ac.lk")) ? "ROLE_LIBRARIAN" : "ROLE_PATRON";
        user.setRole(role);

        // TODO Auto-generated method stub
        return userDao.createUser(user);
    }

    /**
     * @return List of users.
     */
    @Override
    public List<User> listUsers() {
        return userDao.findAll();
    }

    /**
     * @param id
     * @return
     */
    @Override
    public User findUser(Integer id) {
        return userDao.getUser(id);
    }

    /**
     *
     * @param user
     * @param token
     */
    @Override
    public void createToken(User user, String token) {
        UserVerfToken userVerfToken = new UserVerfToken(token, user);
        tokenDao.storeToken(userVerfToken);
    }

    /**
     *
     * @param token
     * @return
     */
    @Override
    public UserVerfToken getUserToken(String token) {
        return tokenDao.findToken(token);
    }

    /**
     *
     * @param user
     */
    @Override
    public void saveValidatedUser(User user) {
        userDao.updateUser(user);
    }

    /**
     *
     * @param usermail
     * @return
     */
    @Override
    public User findUserByEmail(String usermail) {
        User user = userDao.findUserByEmail(usermail);
        return user;
    }
}
