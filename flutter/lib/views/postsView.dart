import 'package:SocialNetwork/domain/post/reaction.dart';
import 'package:SocialNetwork/views/colors.dart';
import 'package:flutter/gestures.dart';
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
            buildHeader(model),
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
            Expanded(child: Offstage(
                offstage: model.posts == null || model.posts.length == 0,
                child: ListView.builder(
                  itemCount: model.posts.length,
                  itemBuilder: (context, index) {
                    Post post = model.posts[index];
                    return buildPostView(post, model);
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPostView(Post post, PostsViewModel model) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(10),
      decoration: new BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.sectionBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Text(
                  post.user.username ?? "Teste", 
                  style: TextStyle(color: AppColors.primaryTextColor)),
              ),
              Text(post.date.toString()),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(post.text ?? "AAAAAAA"),
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                child: buildReactionView(model, post, "Gostei: ", ReactionType.REACTION_LIKE),
              ),
              Expanded(
                child: buildReactionView(model, post, "Não gostei: ", ReactionType.REACTION_DISLIKE),
              ),
            ],
          )
        ],
      ),
    );
  }

  Text buildReactionView(PostsViewModel model, Post post, String text, ReactionType reactionType) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text, 
            style: TextStyle(color: AppColors.primaryTextColor),
            recognizer: new TapGestureRecognizer()
              ..onTap = () { model.reactToPost(post, reactionType);
            },
          ),
          TextSpan(text: "${post.reactions[reactionType] ?? 0}")
        ]
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildHeader(PostsViewModel model) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(10),
      decoration: new BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.sectionBackgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(child: BindingTextField(
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
                  "Enviar",
                  style: TextStyle(color: Colors.white)),
                onPressed: () => model.createPost(),
              ),
            ),
          ),
        ]
      ),
    );
  }
}