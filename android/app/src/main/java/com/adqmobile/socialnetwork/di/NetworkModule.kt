package com.adqmobile.socialnetwork.di

import android.util.Log
import com.google.gson.GsonBuilder
import okhttp3.Cache
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import org.koin.android.ext.koin.androidApplication
import org.koin.dsl.module.module
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

private const val CONNECT_TIMEOUT = 15L
private const val WRITE_TIMEOUT = 15L
private const val READ_TIMEOUT = 15L

val networkModule = module {
    single { Cache(androidApplication().cacheDir, 10L * 1024 * 1024) }

    single { GsonBuilder().create() }

    single {
        OkHttpClient.Builder().apply {
            cache(get())
            connectTimeout(CONNECT_TIMEOUT, TimeUnit.SECONDS)
            writeTimeout(WRITE_TIMEOUT, TimeUnit.SECONDS)
            readTimeout(READ_TIMEOUT, TimeUnit.SECONDS)
            retryOnConnectionFailure(true)
            addInterceptor { chain ->
                chain.proceed(chain.request().newBuilder().apply {
                    header("Accept", "*")
                }.build())
            }
            addInterceptor { chain ->
                val request = chain.request()
                Log.d("HTTP REQUEST", request.toString())
                val response = chain.proceed(request)
                if (!response.isSuccessful) {
                    Log.e("HTTP REQUEST", response.message())
                }
                response
            }
        }.build()
    }

    single {
        Retrofit.Builder()
            .baseUrl("http://192.168.0.16:8080/")
            .addConverterFactory(GsonConverterFactory.create(get()))
            .client(get())
            .build()
    }
}