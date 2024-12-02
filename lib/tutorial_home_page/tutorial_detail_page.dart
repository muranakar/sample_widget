// 詳細ページ
import 'package:flutter/material.dart';
import 'package:sample_widget/model/tutorial_widget.dart';

class TutorialDetailPage extends StatelessWidget {
  final TutorialWidget tutorial;

  const TutorialDetailPage({
    super.key,
    required this.tutorial,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tutorial.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: tutorial.page),
        ],
      ),
    );
  }
}