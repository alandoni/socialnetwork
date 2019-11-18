package com.adqmobile.socialnetwork.view.login

import androidx.databinding.BindingAdapter
import androidx.lifecycle.MutableLiveData
import androidx.recyclerview.widget.RecyclerView
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout

class BindingAdapters {
    companion object {
        @BindingAdapter("items")
        @JvmStatic
        fun <T>setItems(recyclerView: RecyclerView, list: MutableLiveData<Array<T>>) {
            recyclerView.adapter.let {
                if (it is ListAdapter<*, *> && list.value != null) {
                    val ref = it
                    list.value?.let{ array ->
                        ref.changeItems(array)
                    }
                }
            }
        }

        @BindingAdapter("isRefreshing")
        @JvmStatic
        fun setRefreshing(swipeRefreshLayout: SwipeRefreshLayout, isRefreshing: Boolean) {
            swipeRefreshLayout.isRefreshing = isRefreshing
        }
    }

}