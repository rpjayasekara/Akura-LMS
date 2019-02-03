/**
 *
 */
package com.lms.dao;

import com.lms.entity.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * The user DAO entity for CRUD operations
 */
@Transactional
public interface UserDao {

    /**
     * @param uEntity
     * @return The user object.
     */
    User createUser(User uEntity);

    /**
     * @return The list of user.
     */
    List<User> findAll();
    
    List<User> findAllStudents();

    /**
     * @param id
     * @return The user object.
     */
    User getUser(Integer id);

    /**
     * @param usermail
     * @return The user object.
     */
    User findUserByEmail(String usermail);
    
    User findUserBySJUID(long id);

    /**
     * @param user
     */
    void updateUser(User user);

    /**
     * Remove a user by ID
     *
     * @param id
     * @return
     */
    boolean removeUser(Integer id);
}
