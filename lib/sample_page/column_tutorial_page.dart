import 'package:flutter/material.dart';

class ColumnTutorialPage extends StatefulWidget {
  const ColumnTutorialPage({super.key});

  @override
  State<ColumnTutorialPage> createState() => _ColumnTutorialPageState();
}

class _ColumnTutorialPageState extends State<ColumnTutorialPage> {
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize mainAxisSize = MainAxisSize.max;
  double spacing = 8.0;
  int itemCount = 3;
  double itemWidth = 60.0;
  double itemHeight = 60.0;

  List<Color> itemColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // 固定された実装例エリア
          Container(
            height: 300, // Rowより高さを増やす
            color: Colors.grey[100],
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  mainAxisSize: mainAxisSize,
                  children: List.generate(
                    itemCount,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: index < itemCount - 1 ? spacing : 0,
                      ),
                      child: Container(
                        width: itemWidth,
                        height: itemHeight,
                        color: itemColors[index % itemColors.length],
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // スクロール可能な設定エリア
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // コード表示
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'コード',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '''Column(
  mainAxisAlignment: $mainAxisAlignment,
  crossAxisAlignment: $crossAxisAlignment,
  mainAxisSize: $mainAxisSize,
  children: [
    Container(width: $itemWidth, height: $itemHeight),
    SizedBox(height: $spacing),
    Container(width: $itemWidth, height: $itemHeight),
    // ...
  ],
)''',
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // アライメント設定
                  _buildSection(
                    'アライメント設定',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('MainAxisAlignment (垂直):'),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: MainAxisAlignment.values
                              .map((alignment) => ChoiceChip(
                                    label: Text(alignment.name),
                                    selected: mainAxisAlignment == alignment,
                                    onSelected: (selected) {
                                      if (selected) {
                                        setState(() {
                                          mainAxisAlignment = alignment;
                                        });
                                      }
                                    },
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                        const Text('CrossAxisAlignment (水平):'),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            CrossAxisAlignment.start,
                            CrossAxisAlignment.center,
                            CrossAxisAlignment.end,
                            CrossAxisAlignment.stretch,
                          ]
                              .map((alignment) => ChoiceChip(
                                    label: Text(alignment.name),
                                    selected: crossAxisAlignment == alignment,
                                    onSelected: (selected) {
                                      if (selected) {
                                        setState(() {
                                          crossAxisAlignment = alignment;
                                        });
                                      }
                                    },
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                        const Text('MainAxisSize:'),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: MainAxisSize.values
                              .map((size) => ChoiceChip(
                                    label: Text(size.name),
                                    selected: mainAxisSize == size,
                                    onSelected: (selected) {
                                      if (selected) {
                                        setState(() {
                                          mainAxisSize = size;
                                        });
                                      }
                                    },
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),

                  // アイテム設定
                  _buildSection(
                    'アイテム設定',
                    Column(
                      children: [
                        _buildSliderRow(
                          label: 'アイテム数',
                          value: itemCount.toDouble(),
                          min: 1,
                          max: 5,
                          divisions: 4,
                          onChanged: (value) {
                            setState(() {
                              itemCount = value.toInt();
                            });
                          },
                        ),
                        _buildSliderRow(
                          label: '間隔',
                          value: spacing,
                          min: 0,
                          max: 50,
                          onChanged: (value) {
                            setState(() {
                              spacing = value;
                            });
                          },
                        ),
                        _buildSliderRow(
                          label: 'アイテム幅',
                          value: itemWidth,
                          min: 20,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              itemWidth = value;
                            });
                          },
                        ),
                        _buildSliderRow(
                          label: 'アイテム高さ',
                          value: itemHeight,
                          min: 20,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              itemHeight = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSliderRow({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
    int? divisions,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(label),
        ),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(value.toStringAsFixed(1)),
        ),
      ],
    );
  }
}