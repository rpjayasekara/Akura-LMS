/**
 *
 */
package com.lms.service;

import com.lms.entity.User;
import com.lms.entity.UserVerfToken;

import java.util.List;

/**
 * @author SkandaBhargav
 */
public interface UserService {


    /**
     * @param sjsuid
     * @param useremail
     * @param password
     * @return
     */
    User createUser(long sjsuid, String useremail, String password, String role);

    /**
     * @return
     */
    List<User> listUsers();

    /**
     *
     * @param id
     * @return
     */
    public List<User> listStudents();
    
    public User findUser(Integer id);

    /**
     *
     * @param usermail
     * @return
     */
    public User findUserByEmail(String usermail);
    
    public User findUserBySJUID(long id);

    /**
     *
     * @param user
     * @param token
     */
    void createToken(User user, String token);

    /**
     *
     * @param token
     * @return
     */
    UserVerfToken getUserToken(String token);

    /**
     *
     * @param user
     */
    void saveValidatedUser(User user);
}
