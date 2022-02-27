import 'package:flutter/material.dart';
import 'package:training/models/post.dart';
import 'package:training/services/post_service.dart';

class PostProvider extends ChangeNotifier {
  List<Post>? posts;
  bool? requestSuccess;

  Future<void> getPosts() async {
    final _taskService = PostService();

    await _taskService.getPosts().then((value) {
      posts = value;
      _onSuccess();
    }).onError((error, stackTrace) {
      _onFailure();
    });
  }

  void _onSuccess() {
    requestSuccess = true;
    notifyListeners();
  }

  void _onFailure() {
    requestSuccess = false;
    notifyListeners();
  }

  void refresh() {
    requestSuccess = null;
    posts = null;
    notifyListeners();
  }
}
