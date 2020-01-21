import "package:flutter/material.dart";
import "views/loginView.dart";
import 'views/postsView.dart';
import 'package:SocialNetwork/views/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        primaryColor: AppColors.primaryColor,
        backgroundColor: AppColors.backgroundColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        buttonColor: AppColors.primaryColor,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginView(title: "Social Network"),
        "/posts": (context) => PostsView(title: "Social Network")
      },
    );
  }
}
