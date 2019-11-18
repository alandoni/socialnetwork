package com.adqmobile.socialnetwork.domain.user

import androidx.room.Entity
import androidx.room.PrimaryKey
import com.google.gson.annotations.SerializedName

@Entity(tableName = "users")
data class User(@PrimaryKey @field:SerializedName("id") val id: Long?,
                @field:SerializedName("name") val username: String,
                @field:SerializedName("email") val email: String)