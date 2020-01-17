import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'bindingTextField.dart';
import 'loginViewModel.dart';

class LoginView extends StatelessWidget {
  LoginView({Key key, this.title}) : super(key: key);

  final String title;

  void goToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, "/posts");
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(),
      onModelReady: (model) { 
        model.loadData(); 
        model.goToNextScreen = () => this.goToLoginScreen(context);
      },
      builder: (context, model, child) => buildWidget(context, model, child)
    );
  }

  Widget buildWidget(BuildContext context, LoginViewModel model, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Offstage(
                offstage: model.error == null,
                child: Text(
                  model.error ?? "",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              BindingTextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email"
                ),
                text: model.email,
              ),
              BindingTextField(
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha"
                ),
                text: model.password,
              ),
              Divider(),
              ButtonTheme(
                child: RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white)),
                  onPressed: () => model.doLogin(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}