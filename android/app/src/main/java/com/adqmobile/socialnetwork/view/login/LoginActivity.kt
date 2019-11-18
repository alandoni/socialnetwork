package com.adqmobile.socialnetwork.view.login

import android.content.Intent
import android.os.Bundle
import androidx.lifecycle.Observer
import com.adqmobile.socialnetwork.R
import com.adqmobile.socialnetwork.databinding.ActivityLoginBinding
import kotlinx.android.synthetic.main.activity_login.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class LoginActivity : BindingActivity<ActivityLoginBinding>() {

    private val viewModel: LoginViewModel by viewModel()

    override fun getLayoutId(): Int {
        return R.layout.activity_login
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding.viewModel = viewModel

        viewModel.getUser()

        viewModel.loggedInUser.observe(this, Observer {
            val intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
            finish()
        })

        login.setOnClickListener {
            viewModel.login()
        }
    }
}