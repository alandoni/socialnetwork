package com.adqmobile.socialnetwork.view.login

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.Reaction
import com.adqmobile.socialnetwork.domain.post.usecases.CreatePostUseCase
import com.adqmobile.socialnetwork.domain.post.usecases.GetAllPostsUseCase
import com.adqmobile.socialnetwork.domain.post.usecases.ReactToPostUseCase
import com.adqmobile.socialnetwork.domain.user.User
import kotlinx.coroutines.launch
import java.lang.Exception
import java.util.*

class PostsListViewModel(
        private val currentUser: User,
        private val getAllPostsUseCase: GetAllPostsUseCase,
        private val createPostUseCase: CreatePostUseCase,
        private val reactToPostUseCase: ReactToPostUseCase): ViewModel() {

    val posts = MutableLiveData<Array<Post>>()
    val newPost = MutableLiveData<String>()
    val error = MutableLiveData<String>()
    val loading = MutableLiveData<Boolean>()

    fun createPost() {
        viewModelScope.launch {
            loading.value = true
            val post = Post(null, currentUser, newPost.value!!, Date().time, null)
            try {
                createPostUseCase.run(post)
                newPost.value = ""
                loadPostsFromRepository()
            } catch (e: Exception) {
                error.value = e.localizedMessage
            }
            loading.value = false
        }
    }

    fun loadPosts() {
        viewModelScope.launch {
            loading.value = true
            try {
                loadPostsFromRepository()
                if (posts.value.isNullOrEmpty()) {
                    error.value = "Nenhum post encontrado"
                } else {
                    error.value = null
                }
            } catch (e: Exception) {
                error.value = e.localizedMessage
            }
            loading.value = false
        }
    }

    private suspend fun loadPostsFromRepository() {
        posts.value = getAllPostsUseCase.run()
    }

    fun likePost(post: Post) {
        reactToPost(post, Reaction.ReactionType.REACTION_LIKE)
    }

    fun dislikePost(post: Post) {
        reactToPost(post, Reaction.ReactionType.REACTION_DISLIKE)
    }

    private fun reactToPost(post: Post, reactionType: Reaction.ReactionType) {
        viewModelScope.launch {
            val reaction = Reaction(null, post, reactionType, currentUser, Date().time)
            try {
                reactToPostUseCase.run(reaction)
                loadPostsFromRepository()
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }
}