import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/providers/post_provider.dart';
import 'package:training/view/post_list/widgets/post_tile.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, provider, _) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: provider.posts?.length,
        itemBuilder: (context, index) {
          return PostTile(provider.posts![index]);
        },
      );
    });
  }
}
