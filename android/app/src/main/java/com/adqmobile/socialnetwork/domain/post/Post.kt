package com.adqmobile.socialnetwork.domain.post

import androidx.room.Entity
import androidx.room.Embedded
import androidx.room.PrimaryKey
import androidx.room.Relation
import com.adqmobile.socialnetwork.domain.user.User
import com.google.gson.annotations.SerializedName

@Entity(tableName = "posts")
data class Post(@PrimaryKey @field:SerializedName("id") val id: Long?,
                @Embedded(prefix = "user_") val user: User,
                @field:SerializedName("text")val text: String,
                @field:SerializedName("date")val date: Long/*,
                @Relation(parentColumn =  "Reaction.postId", entityColumn = "Reaction.id")
                val reactions: Array<Reaction>*/)