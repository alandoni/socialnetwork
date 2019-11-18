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
            login.value = Login("", "")
            val users = getAllUsersUseCase.run()
            if (users.isNotEmpty()) {
                loggedInUser.value = users[0]
                User.loggedUser = loggedInUser.value
            }
            loading.value = false
        }
    }

    fun login() {
        viewModelScope.launch {
            loading.value = true
            error.value = null
            try {
                loggedInUser.value = loginUseCase.run(login.value!!)
                User.loggedUser = loggedInUser.value
            } catch (e: Exception) {
                e.printStackTrace()
                error.value = e
            }
            loading.value = false
        }
    }
}