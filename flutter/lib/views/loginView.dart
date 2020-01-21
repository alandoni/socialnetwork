import 'package:SocialNetwork/views/colors.dart';
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

  Widget content(BuildContext context, LoginViewModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Login",
          style: TextStyle(color: AppColors.primaryTextColor, fontSize: 28),
        ),
        Offstage(
          offstage: model.error == null,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            padding: const EdgeInsets.fromLTRB(12, 6, 6, 6),
            decoration: new BoxDecoration(
              border: Border.all(color: AppColors.errorBorderColor),
              color: AppColors.errorBackgroundColor,
            ),
            child: Text(
              model.error ?? "",
              style: TextStyle(color: AppColors.errorTextColor),
            ),
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
    );
  }

  Widget buildWidget(BuildContext context, LoginViewModel model, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: new BoxDecoration(
            border: new Border.all(color: AppColors.borderColor),
            color: AppColors.sectionBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: this.content(context, model),
          ),
        ),
      ),
    );
  }
}