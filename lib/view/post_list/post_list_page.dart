import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/providers/post_provider.dart';
import 'package:training/view/post_list/widgets/post_list.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        backgroundColor: Colors.grey.shade300,
        body: ChangeNotifierProvider.value(
            value: PostProvider(),
            child: Consumer<PostProvider>(builder: (context, provider, _) {
              if (provider.requestSuccess == null) {
                provider.getPosts();
                return const Center(child: CircularProgressIndicator());
              } else {
                return RefreshIndicator(
                    child: const PostList(),
                    onRefresh: () async {
                      provider.refresh();
                    });
              }
            })));
  }
}
