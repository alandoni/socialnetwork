package com.adqmobile.socialnetwork.domain.user.usecases

import com.adqmobile.socialnetwork.domain.user.User
import com.adqmobile.socialnetwork.domain.user.UserRepository

class GetAllUsersUseCase(private val userRepository: UserRepository) {

    suspend fun run(): Array<User> {
        return userRepository.retrieveAll()
    }
}