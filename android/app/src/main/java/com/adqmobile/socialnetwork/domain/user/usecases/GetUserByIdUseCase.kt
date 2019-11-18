package com.adqmobile.socialnetwork.domain.user.usecases

import com.adqmobile.socialnetwork.domain.user.User
import com.adqmobile.socialnetwork.domain.user.UserRepository

class GetUserByIdUseCase(private val userRepository: UserRepository) {

    suspend fun run(id: Long): User {
        return userRepository.retrieveById(id)
    }
}