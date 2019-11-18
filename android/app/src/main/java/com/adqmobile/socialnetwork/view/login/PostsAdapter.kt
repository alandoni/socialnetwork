package com.adqmobile.socialnetwork.view.login

import com.adqmobile.socialnetwork.R
import com.adqmobile.socialnetwork.databinding.PostItemBinding
import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.Reaction

class PostsAdapter(
        items: Array<Post>,
        private val onReact: OnReactInterface
): ListAdapter<Post, PostItemBinding>(items, R.layout.post_item) {

    override fun onBindViewHolder(holder: ViewHolder<PostItemBinding>, position: Int) {
        val post = items[position]
        holder.binding.post = post
        holder.binding.likesCounter.text = post.reactions?.get(Reaction.ReactionType.REACTION_LIKE.value)?.toString() ?: "0"
        holder.binding.dislikesCounter.text = post.reactions?.get(Reaction.ReactionType.REACTION_DISLIKE.value)?.toString() ?: "0"
        holder.binding.likes.setOnClickListener {
            onReact.onLike(post)
        }
        holder.binding.dislikes.setOnClickListener {
            onReact.onDislike(post)
        }
    }
}

interface OnReactInterface {
    fun onLike(post: Post)
    fun onDislike(post: Post)
}