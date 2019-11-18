package com.adqmobile.socialnetwork.domain.post

import androidx.room.*
import com.adqmobile.socialnetwork.data.local.DatabaseMapConverter
import com.adqmobile.socialnetwork.domain.user.User
import com.google.gson.annotations.SerializedName
import java.util.*

@Entity(tableName = "posts")
data class Post(@PrimaryKey @field:SerializedName("id") val id: Long?,
                @Embedded(prefix = "user_") val user: User,
                @field:SerializedName("text") val text: String,
                @field:SerializedName("date") val date: Long,
                @field:SerializedName("reactions") @TypeConverters(DatabaseMapConverter::class) val reactions: Map<String, Int>?) {

    fun formattedDate(): String {
        return Date(date).toGMTString()
    }
}