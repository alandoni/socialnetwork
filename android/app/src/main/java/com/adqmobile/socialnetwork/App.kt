package com.adqmobile.socialnetwork

import android.app.Application
import com.adqmobile.socialnetwork.di.apiModule
import com.adqmobile.socialnetwork.di.networkModule
import com.adqmobile.socialnetwork.di.roomModule
import com.adqmobile.socialnetwork.di.viewModelModule
import org.koin.android.ext.android.startKoin

class App: Application() {
    override fun onCreate() {
        super.onCreate()

        startKoin(this, listOf(
            networkModule,
            apiModule,
            roomModule,
            viewModelModule
        ))
    }
}