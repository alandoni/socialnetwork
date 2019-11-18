package com.adqmobile.socialnetwork.data.local

import android.content.Context
import androidx.room.*
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import androidx.sqlite.db.SupportSQLiteOpenHelper
import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.Reaction
import com.adqmobile.socialnetwork.domain.user.User

@Database(
    entities = [User::class, Post::class],
    version = AppDatabase.DB_VERSION,
    exportSchema = false)
@TypeConverters(DatabaseMapConverter::class)
abstract class AppDatabase: RoomDatabase() {

    abstract fun userDao(): UserDao
    abstract fun postDao(): PostDao

    companion object {
        const val DB_VERSION = 2

        const val DB_NAME = "socialnetwork.db"

        val MIGRATION_1_TO_2 = object : Migration(1, 2) {
            override fun migrate(database: SupportSQLiteDatabase) {
                database.execSQL("ALTER TABLE posts ADD COLUMN reactions TEXT DEFAULT NULL")
            }
        }
    }
}