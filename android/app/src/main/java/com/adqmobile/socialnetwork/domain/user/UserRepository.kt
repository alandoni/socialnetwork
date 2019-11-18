package com.adqmobile.socialnetwork.domain.user

interface UserRepository {
    suspend fun store(user: User)
    suspend fun retrieveById(id: Long): User
    suspend fun retrieveAll(): Array<User>
    suspend fun login(login: Login): User
}