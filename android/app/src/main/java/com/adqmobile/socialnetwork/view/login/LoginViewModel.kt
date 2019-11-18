package com.adqmobile.socialnetwork.view.login

import android.view.View
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.adqmobile.socialnetwork.domain.user.Login
import com.adqmobile.socialnetwork.domain.user.User
import com.adqmobile.socialnetwork.domain.user.usecases.GetAllUsersUseCase
import com.adqmobile.socialnetwork.domain.user.usecases.GetUserByIdUseCase
import com.adqmobile.socialnetwork.domain.user.usecases.LoginUseCase
import kotlinx.coroutines.launch
import java.lang.Exception

class LoginViewModel(
    private val loginUseCase: LoginUseCase,
    private val getAllUsersUseCase: GetAllUsersUseCase): ViewModel() {

    val loading = MutableLiveData<Boolean>()
    val login = MutableLiveData<Login>()
    val error = MutableLiveData<Exception>()
    val loggedInUser = MutableLiveData<User>()

    fun getUser() {
        viewModelScope.launch {
            loading.value = true
            val users = getAllUsersUseCase.run()
            loggedInUser.value = users[0]
            loading.value = false
        }
    }

    fun login() {
        viewModelScope.launch {
            loading.value = true
            error.value = null
            try {
                loggedInUser.value = loginUseCase.run(login.value!!)
            } catch (e: Exception) {
                error.value = e
            }
            loading.value = false
        }
    }
}