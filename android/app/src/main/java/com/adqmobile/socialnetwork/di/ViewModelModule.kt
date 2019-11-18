package com.adqmobile.socialnetwork.di

import com.adqmobile.socialnetwork.data.PostRepositoryImpl
import com.adqmobile.socialnetwork.data.UserRepositoryImpl
import com.adqmobile.socialnetwork.domain.post.PostRepository
import com.adqmobile.socialnetwork.domain.post.usecases.*
import com.adqmobile.socialnetwork.domain.user.User
import com.adqmobile.socialnetwork.domain.user.UserRepository
import com.adqmobile.socialnetwork.domain.user.usecases.GetAllUsersUseCase
import com.adqmobile.socialnetwork.domain.user.usecases.GetUserByIdUseCase
import com.adqmobile.socialnetwork.domain.user.usecases.LoginUseCase
import com.adqmobile.socialnetwork.domain.user.usecases.StoreUserUseCase
import com.adqmobile.socialnetwork.view.login.LoginViewModel
import org.koin.androidx.viewmodel.ext.koin.viewModel
import org.koin.dsl.module.module
import com.adqmobile.socialnetwork.view.login.PostsListViewModel

val viewModelModule = module {
    factory<PostRepository> { PostRepositoryImpl(get(), get()) }
    factory<UserRepository> { UserRepositoryImpl(get(), get()) }

    factory { StoreUserUseCase(get()) }
    factory { GetUserByIdUseCase(get()) }
    factory { GetAllUsersUseCase(get()) }
    factory { LoginUseCase(get(), get()) }

    factory { CreatePostUseCase(get()) }
    factory { GetAllPostsUseCase(get()) }
    factory { GetAllReactionsUseCase(get()) }
    factory { GetReactionsForPostUseCase(get()) }
    factory { ReactToPostUseCase(get()) }

    factory { User.loggedUser!! }
    viewModel { LoginViewModel(get(), get()) }
    viewModel { PostsListViewModel(get(), get(), get(), get()) }
}