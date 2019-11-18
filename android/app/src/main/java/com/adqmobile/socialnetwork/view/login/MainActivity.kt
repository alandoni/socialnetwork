package com.adqmobile.socialnetwork.view.login

import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.adqmobile.socialnetwork.R
import com.adqmobile.socialnetwork.databinding.ActivityMainBinding
import com.adqmobile.socialnetwork.domain.post.Post
import com.adqmobile.socialnetwork.domain.post.Reaction
import org.koin.androidx.viewmodel.ext.android.viewModel

class MainActivity : BindingActivity<ActivityMainBinding>() {

    private val viewModel: PostsListViewModel by viewModel()

    override fun getLayoutId(): Int {
        return R.layout.activity_main
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding.viewModel = viewModel

        binding.recyclerView.adapter = PostsAdapter(emptyArray(), onReact = object: OnReactInterface {
            override fun onLike(post: Post) {
                viewModel.likePost(post)
            }

            override fun onDislike(post: Post) {
                viewModel.dislikePost(post)
            }
        })

        binding.recyclerView.layoutManager = LinearLayoutManager(this)

        binding.swipeContainer.setOnRefreshListener {
            viewModel.loadPosts()
        }

        binding.sendButton.setOnClickListener {
            viewModel.createPost()
        }

        viewModel.loadPosts()
    }
}
