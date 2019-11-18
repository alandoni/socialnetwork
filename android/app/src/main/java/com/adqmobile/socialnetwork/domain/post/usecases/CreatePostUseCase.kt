package com.adqmobile.socialnetwork.domain.post.usecases

import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.PostRepository

class CreatePostUseCase(private val postRepository: PostRepository) {

    suspend fun run(post: Post) {
        postRepository.createPost(post)
    }
}