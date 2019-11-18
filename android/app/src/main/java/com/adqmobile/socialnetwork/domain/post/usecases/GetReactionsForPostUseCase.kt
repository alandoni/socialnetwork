package com.adqmobile.socialnetwork.domain.post.usecases

import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.PostRepository
import com.adqmobile.socialnetwork.domain.post.Reaction

class GetReactionsForPostUseCase(private val postRepository: PostRepository) {

    suspend fun run(post: Post): Array<Reaction> {
        return postRepository.retrieveReactionsForPost(post)
    }
}