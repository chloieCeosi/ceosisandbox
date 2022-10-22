import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/providers.dart';
import 'package:sandbox/examples/june/widgets/post_list_widget.dart';
import 'package:sandbox/examples/june/widgets/search_filter_widget.dart';

import '../constants/labels.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postsFutureProvider);
    AsyncValue<List<PostListModel>?> filteredData =
        ref.watch(filteredPostsProvider);
    ref.read(filteredPostsProvider.notifier).filter(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Label.postListTitle),
        centerTitle: true,
      ),
      body: filteredData.when(
        data: (data) {
          List<PostListModel> postList = data!.map((e) => e).toList();
          return Column(
            children: <Widget>[
              SearchFilter(),
              Expanded(child: PostListWidget(postList: postList)),
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
