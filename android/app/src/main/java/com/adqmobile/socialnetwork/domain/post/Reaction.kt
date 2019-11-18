package com.adqmobile.socialnetwork.domain.post

import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.PrimaryKey
import com.adqmobile.socialnetwork.domain.user.User
import com.google.gson.annotations.SerializedName

data class Reaction(val id: Long?,
                    val post: Post,
                    val user: User,
                    val type: String) {

    enum class ReactionType {
        LIKE,
        NOT_LIKE
    }
}