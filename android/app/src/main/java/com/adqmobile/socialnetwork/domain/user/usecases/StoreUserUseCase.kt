package com.adqmobile.socialnetwork.domain.user.usecases

import com.adqmobile.socialnetwork.domain.user.User
import com.adqmobile.socialnetwork.domain.user.UserRepository

class StoreUserUseCase(private val userRepository: UserRepository) {

    suspend fun run(user: User) {
        userRepository.store(user)
    }
}