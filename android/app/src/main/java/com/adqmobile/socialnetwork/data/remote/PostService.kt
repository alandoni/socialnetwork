package com.adqmobile.socialnetwork.data.remote

import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.Reaction
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Path

interface PostService {
    @POST("post")
    suspend fun postPost(post: Post): Post

    @POST("post/{id}/reaction")
    suspend fun postReaction(@Path("id") id: String): Reaction

    @GET("post")
    suspend fun getPosts(): Array<Post>

    @GET("post/{id}/reaction")
    suspend fun getReactionsForPost(@Path("id") id: String): Array<Reaction>
}