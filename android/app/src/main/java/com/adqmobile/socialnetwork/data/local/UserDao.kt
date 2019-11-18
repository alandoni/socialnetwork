package com.adqmobile.socialnetwork.data.local

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.adqmobile.socialnetwork.domain.user.User

@Dao
interface UserDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(user: User)

    @Query("SELECT * FROM users WHERE id = :id")
    suspend fun selectById(id: Long): Array<User>

    @Query("SELECT * FROM users")
    suspend fun selectAll(): Array<User>
}