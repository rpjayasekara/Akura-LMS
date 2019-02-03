/**
 *
 */
package com.lms.dao;

import com.lms.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import java.util.List;

/**
 * The UserDaoImpl for implementing all user related CRUD methods.
 */
@Transactional
@Repository
public class UserDaoImpl implements UserDao {
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    /**
     * @param uEntity
     * @return The user book object.
     */
    @Override
    public User createUser(User uEntity) {
        em.persist(uEntity);
        return uEntity;
    }

    /**
     * @param id
     * @return The status of the remove user object.
     */
    @Override
    public boolean removeUser(Integer id) {
        User user = em.find(User.class, id);
        if (user == null) return false;
        em.remove(user);
        return true;
    }

    /**
     * @return The list of all the users.
     */
    @Override
    public List<User> findAll() {
        List<User> users = (List<User>) em.createQuery("select u from User u", User.class).getResultList();
        return users;
    }

    /**
     * @param id
     * @return The user object.
     */
    @Override
    public User getUser(Integer id) {
        User user = em.find(User.class, id);
        return user;
    }

    /**
     * @param user
     */
    @Override
    public void updateUser(User user) {
        em.merge(user);
    }

    /**
     * @param usermail
     * @return The user object.
     */
    @Override
    public User findUserByEmail(String usermail) {
        System.out.println("Email to Query:" + usermail);
        Query query = em.createQuery("select id from User u where u.useremail = ?");
        query.setParameter(1, usermail);
        List userIds = query.getResultList();
        if (userIds.size() > 0) {
            User user = em.find(User.class, userIds.get(0));
            return user;
        }
        return null;
    }

	@Override
	public List<User> findAllStudents() {
		Query query = em.createQuery("select u from User u where u.role = ?");
		query.setParameter(1, "ROLE_PATRON");
		List<User> users = (List<User>)query.getResultList();
		return users;
	}

	@Override
	public User findUserBySJUID(long id) {
		Query query = em.createQuery("select id from User u where u.sjsuid = ?");
        query.setParameter(1, id);
        List userIds = query.getResultList();
        if (userIds.size() > 0) {
            User user = em.find(User.class, userIds.get(0));
            return user;
        }
        return null;
	}

}