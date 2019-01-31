package com.lms.dao;

import com.lms.entity.UserVerfToken;

/**
 * The Token DAO for getting and adding a new authentication token.
 */
public interface TokenDao {

    /**
     * @param token
     * @return A User verification token
     */
    UserVerfToken findToken(String token);

    /**
     * @param userVerfToken
     */
    void storeToken(UserVerfToken userVerfToken);
}
