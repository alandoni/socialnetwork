package com.adqmobile.socialnetwork.domain.post.usecases

import com.adqmobile.socialnetwork.domain.post.PostRepository
import com.adqmobile.socialnetwork.domain.post.Reaction

class ReactToPostUseCase(private val postRepository: PostRepository) {

    suspend fun run(reaction: Reaction) {
        postRepository.reactToPost(reaction)
    }
}