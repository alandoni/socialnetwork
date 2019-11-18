package com.adqmobile.socialnetwork.domain.post.usecases;

import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.PostRepository

class GetAllPostsUseCase(private val postRepository: PostRepository) {

    suspend fun run(): Array<Post> {
        return postRepository.retrieveAllPosts()
    }
}
