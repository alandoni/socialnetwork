package com.adqmobile.socialnetwork.data

import com.adqmobile.socialnetwork.data.local.UserDao
import com.adqmobile.socialnetwork.data.remote.UserService
import com.adqmobile.socialnetwork.domain.user.Login
import com.adqmobile.socialnetwork.domain.user.User
import com.adqmobile.socialnetwork.domain.user.UserRepository
import java.lang.Exception

class UserRepositoryImpl(private val userDao: UserDao,
                         private val userService: UserService) : UserRepository {

    override suspend fun store(user: User) {
        userDao.insert(user)
    }

    override suspend fun retrieveById(id: Long): User {
        return userDao.selectById(id)[0]
    }

    override suspend fun retrieveAll(): Array<User> {
        return userDao.selectAll()
    }

    override suspend fun login(login: Login): User {
        return userService.postLogin(login)
    }
}