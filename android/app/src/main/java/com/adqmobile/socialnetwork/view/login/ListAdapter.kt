package com.adqmobile.socialnetwork.view.login

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.recyclerview.widget.RecyclerView

abstract class ListAdapter<T, B: ViewDataBinding>(
    var items: Array<T>,
    private val layoutId: Int
): RecyclerView.Adapter<ListAdapter.ViewHolder<B>>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder<B> {
        val inflater = LayoutInflater.from(parent.context)
        val binding = DataBindingUtil.inflate(inflater, layoutId, parent, false) as B
        return ViewHolder(binding)
    }

    override fun getItemCount(): Int {
        return items.size
    }

    fun changeItems(items: Array<*>) {
        this.items = items as Array<T>
        notifyDataSetChanged()
    }

    abstract override fun onBindViewHolder(holder: ViewHolder<B>, position: Int)

    class ViewHolder<B: ViewDataBinding>(val binding: B) : RecyclerView.ViewHolder(binding.root)
}
