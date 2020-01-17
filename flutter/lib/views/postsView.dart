import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

import '../domain/post/post.dart';
import 'bindingTextField.dart';
import 'postsViewModel.dart';

class PostsView extends StatelessWidget {
  PostsView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PostsViewModel>.withConsumer(
      viewModel: PostsViewModel(),
      onModelReady: (model) { 
        model.loadData();
      },
      builder: (context, model, child) => buildWidget(context, model, child)
    );
  }

  Widget buildWidget(BuildContext context, PostsViewModel model, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Offstage(
              offstage: model.error == null,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: Text(
                  model.error ?? "",
                  style: TextStyle(color: Colors.red, backgroundColor: Colors.yellow),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: 
                    BindingTextField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "No que está pensando?"
                      ),
                      text: model.post,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: ButtonTheme(
                      child: RaisedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white)),
                        onPressed: () => model.createPost(),
                      ),
                    ),
                  ),
                ]
              ),
            ),
            Expanded(child: Offstage(
                offstage: model.posts == null || model.posts.length == 0,
                child: ListView.builder(
                  itemCount: model.posts.length,
                  itemBuilder: (context, index) {
                    Post post = model.posts[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(post.user.username ?? ""),
                        Text(post.text ?? ""),
                        Text(post.date.toString()),
                        Divider(),
                      ],
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}