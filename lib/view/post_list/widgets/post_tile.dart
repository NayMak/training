import 'package:flutter/material.dart';
import 'package:training/models/post.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              _TileIcon(post.userId!),
              const SizedBox(width: 24.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(post.body ?? ''),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                children: [
                  const Text(
                    'USER ID',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '${post.userId}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TileIcon extends StatelessWidget {
  final int userId;

  const _TileIcon(this.userId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userId % 5 == 0) {
      return const Icon(Icons.wb_sunny);
    } else if (userId % 5 == 1) {
      return const Icon(Icons.cloud);
    } else if (userId % 5 == 2) {
      return const Icon(Icons.ac_unit);
    } else if (userId % 5 == 3) {
      return const Icon(Icons.local_fire_department);
    } else {
      return const Icon(Icons.water);
    }
  }
}
