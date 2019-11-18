package com.adqmobile.socialnetwork.data.remote

import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.Reaction
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Path

interface PostService {
    @POST("post")
    suspend fun postPost(@Body post: Post): Post

    @POST("post/{id}/reaction")
    suspend fun postReaction(@Path("id") id: Long, @Body reaction: Reaction): Post

    @GET("post")
    suspend fun getPosts(): Array<Post>

    @GET("post/{id}/reaction")
    suspend fun getReactionsForPost(@Path("id") id: Long): Array<Reaction>
}