package com.adqmobile.socialnetwork.domain.post

import com.adqmobile.socialnetwork.data.remote.EnumByValueAdapter
import com.adqmobile.socialnetwork.data.remote.HasValue
import com.adqmobile.socialnetwork.domain.user.User
import com.google.gson.annotations.JsonAdapter

data class Reaction(val id: Long?,
                    val post: Post,
                    val reactionType: ReactionType,
                    val user: User,
                    val date: Long) {

    @JsonAdapter(EnumByValueAdapter::class)
    enum class ReactionType(override val value: String) : HasValue {
        REACTION_LIKE("like"),
        REACTION_DISLIKE("dislike")
    }
}