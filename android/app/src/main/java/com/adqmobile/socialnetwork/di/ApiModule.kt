package com.adqmobile.socialnetwork.di

import com.adqmobile.socialnetwork.data.remote.PostService
import com.adqmobile.socialnetwork.data.remote.UserService
import org.koin.dsl.module.module
import retrofit2.Retrofit

val apiModule = module {
    single(createOnStart = false) { get<Retrofit>().create(UserService::class.java) }
    single(createOnStart = false) { get<Retrofit>().create(PostService::class.java) }
}