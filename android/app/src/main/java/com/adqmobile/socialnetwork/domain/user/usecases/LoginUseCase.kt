package com.adqmobile.socialnetwork.domain.user.usecases

import com.adqmobile.socialnetwork.domain.user.Login
import com.adqmobile.socialnetwork.domain.user.User
import com.adqmobile.socialnetwork.domain.user.UserRepository

class LoginUseCase(private val userRepository: UserRepository,
                   private val storeUserUseCase: StoreUserUseCase) {

    suspend fun run(login: Login): User {
        val user = userRepository.login(login)
        storeUserUseCase.run(user)
        return user
    }
}