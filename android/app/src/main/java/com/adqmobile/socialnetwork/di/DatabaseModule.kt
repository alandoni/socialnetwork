package com.adqmobile.socialnetwork.di

import androidx.room.Room
import com.adqmobile.socialnetwork.data.local.AppDatabase
import org.koin.android.ext.koin.androidApplication
import org.koin.dsl.module.module

val roomModule = module {
    single { Room.databaseBuilder(get(), AppDatabase::class.java, AppDatabase.DB_NAME)
        .addMigrations(AppDatabase.MIGRATION_1_TO_2)
        .build()
    }
    single(createOnStart = false) { get<AppDatabase>().userDao() }
    single(createOnStart = false) { get<AppDatabase>().postDao() }
}