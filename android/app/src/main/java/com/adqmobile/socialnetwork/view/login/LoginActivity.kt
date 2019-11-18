package com.adqmobile.socialnetwork.view.login

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.Observer
import com.adqmobile.socialnetwork.R
import com.adqmobile.socialnetwork.databinding.ActivityLoginBinding
import org.koin.androidx.viewmodel.ext.android.viewModel

class LoginActivity : AppCompatActivity() {

    val viewModel: LoginViewModel by viewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        val binding: ActivityLoginBinding = DataBindingUtil.setContentView(this, R.layout.activity_login)
        binding.viewModel = viewModel
        binding.lifecycleOwner = this

        viewModel.getUser()

        viewModel.loggedInUser.observe(this, Observer {
            val intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
            finish()
        })

        binding.login.setOnClickListener {
            viewModel.login()
        }
    }
}