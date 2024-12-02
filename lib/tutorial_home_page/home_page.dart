import 'package:flutter/material.dart';
import 'package:sample_widget/sample_page/container_page.dart';
import 'package:sample_widget/sample_page/row_page.dart';
import 'package:sample_widget/model/tutorial_widget.dart';
import 'package:sample_widget/tutorial_home_page/tutorial_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Tutorial'),
      ),
      body: ListView(
        children: [
          _buildTutorialCard(
            context: context,
            tutorial: TutorialWidget(
              name: 'Container',
              description: 'パディング、マージン、装飾などを設定できる基本的なウィジェットです。',
              page: const ContainerTutorialPage(),
            ),
          ),
          _buildTutorialCard(
            context: context,
            tutorial: TutorialWidget(
              name: 'Row',
              description: '子ウィジェットを水平方向に配置するためのウィジェットです。',
              page: const RowTutorialPage(),
            ),
          ),
          _buildTutorialCard(
            context: context,
            tutorial: TutorialWidget(
              name: 'Column',
              description: '子ウィジェットを垂直方向に配置するためのウィジェットです。',
              page: const RowTutorialPage(),
            ),
          ),
          // 他のウィジェットも同様に追加
        ],
      ),
    );
  }

  Widget _buildTutorialCard({
    required BuildContext context,
    required TutorialWidget tutorial,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        customBorder: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(tutorial.name),
          subtitle: Text(
            tutorial.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TutorialDetailPage(tutorial: tutorial),
              ),
            );
          },
        ),
      ),
    );
  }
}
