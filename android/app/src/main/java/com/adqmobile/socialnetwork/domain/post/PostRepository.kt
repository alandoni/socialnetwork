package com.adqmobile.socialnetwork.domain.post

interface PostRepository {
    suspend fun createPost(post: Post)
    suspend fun reactToPost(reaction: Reaction)
    suspend fun retrieveAllPosts(): Array<Post>
    suspend fun retrieveReactionsForPost(post: Post): Array<Reaction>
}