package com.adqmobile.socialnetwork.data.remote

import com.adqmobile.socialnetwork.domain.user.Login
import com.adqmobile.socialnetwork.domain.user.User
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.POST

interface UserService {

    @POST("login")
    suspend fun postLogin(@Body login: Login): User
}