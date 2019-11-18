package com.adqmobile.socialnetwork.data.local;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy
import androidx.room.Query

import com.adqmobile.socialnetwork.domain.post.Post

@Dao
interface PostDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(post: Post)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(post: Array<Post>)

    @Query("SELECT * FROM posts")
    suspend fun selectAll(): Array<Post>?

}
