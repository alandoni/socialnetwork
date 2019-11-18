package com.adqmobile.socialnetwork.data

import com.adqmobile.socialnetwork.data.local.PostDao
import com.adqmobile.socialnetwork.data.remote.PostService
import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.PostRepository
import com.adqmobile.socialnetwork.domain.post.Reaction

class PostRepositoryImpl(
    private val postDao: PostDao,
    private val postService: PostService) : PostRepository {

    override suspend fun createPost(post: Post) {
        val newPost = postService.postPost(post)
        postDao.insert(newPost)
    }

    override suspend fun reactToPost(reaction: Reaction) {
        val post = postService.postReaction(reaction.post.id!!, reaction)
        postDao.insert(post)
    }

    override suspend fun retrieveAllPosts(): Array<Post> {
        val posts = postService.getPosts()
        postDao.insert(posts)
        return posts
    }

    override suspend fun retrieveReactionsForPost(post: Post): Array<Reaction> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

}