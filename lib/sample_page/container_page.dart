import 'package:flutter/material.dart';

class ContainerTutorialPage extends StatefulWidget {
  const ContainerTutorialPage({super.key});

  @override
  State<ContainerTutorialPage> createState() => _ContainerTutorialPageState();
}

class _ContainerTutorialPageState extends State<ContainerTutorialPage> {
  double width = 200;
  double height = 200;
  double borderRadius = 0;
  double borderWidth = 1;
  double padding = 0;
  Color containerColor = Colors.blue;
  Color borderColor = Colors.black;
  double elevationValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 固定された実装例エリア
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(padding),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    color: borderColor,
                    width: borderWidth,
                  ),
                  boxShadow: elevationValue > 0
                      ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: elevationValue / 2,
                            blurRadius: elevationValue,
                            offset: Offset(0, elevationValue / 2),
                          ),
                        ]
                      : null,
                ),
                child: const Center(
                  child: Text(
                    'Container',
                    style: TextStyle(color: Colors.white),
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
                              '''Container(
  width: $width,
  height: $height,
  padding: EdgeInsets.all($padding),
  decoration: BoxDecoration(
    color: ${containerColor.toString()},
    borderRadius: BorderRadius.circular($borderRadius),
    border: Border.all(
      color: ${borderColor.toString()},
      width: $borderWidth,
    ),${elevationValue > 0 ? '''
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: ${elevationValue / 2},
        blurRadius: $elevationValue,
        offset: Offset(0, ${elevationValue / 2}),
      ),
    ]''' : ''}
  ),
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

                  // 設定コントロール
                  _buildSection(
                    'サイズ設定',
                    Column(
                      children: [
                        _buildSliderRow(
                          label: '幅',
                          value: width,
                          min: 50,
                          max: 300,
                          onChanged: (value) => setState(() => width = value),
                        ),
                        _buildSliderRow(
                          label: '高さ',
                          value: height,
                          min: 50,
                          max: 300,
                          onChanged: (value) => setState(() => height = value),
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    'スタイル設定',
                    Column(
                      children: [
                        _buildSliderRow(
                          label: '角丸',
                          value: borderRadius,
                          min: 0,
                          max: 50,
                          onChanged: (value) => setState(() => borderRadius = value),
                        ),
                        _buildSliderRow(
                          label: '枠線の太さ',
                          value: borderWidth,
                          min: 0,
                          max: 10,
                          onChanged: (value) => setState(() => borderWidth = value),
                        ),
                        _buildSliderRow(
                          label: 'パディング',
                          value: padding,
                          min: 0,
                          max: 50,
                          onChanged: (value) => setState(() => padding = value),
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    'エフェクト設定',
                    Column(
                      children: [
                        _buildSliderRow(
                          label: '影の強さ',
                          value: elevationValue,
                          min: 0,
                          max: 20,
                          onChanged: (value) => setState(() => elevationValue = value),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('コンテナの色: '),
                            _buildColorButton(
                              color: containerColor,
                              onPressed: _showContainerColorPicker,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('枠線の色: '),
                            _buildColorButton(
                              color: borderColor,
                              onPressed: _showBorderColorPicker,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 以下のヘルパーメソッドは変更なし
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

  Widget _buildColorButton({
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(40, 40),
        padding: EdgeInsets.zero,
      ),
      child: const SizedBox(),
    );
  }

  void _showContainerColorPicker() {
    _showColorPicker(
      initialColor: containerColor,
      onColorChanged: (color) => setState(() => containerColor = color),
    );
  }

  void _showBorderColorPicker() {
    _showColorPicker(
      initialColor: borderColor,
      onColorChanged: (color) => setState(() => borderColor = color),
    );
  }

  void _showColorPicker({
    required Color initialColor,
    required ValueChanged<Color> onColorChanged,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final color in [
                Colors.red,
                Colors.pink,
                Colors.purple,
                Colors.deepPurple,
                Colors.indigo,
                Colors.blue,
                Colors.lightBlue,
                Colors.cyan,
                Colors.teal,
                Colors.green,
                Colors.lightGreen,
                Colors.lime,
                Colors.yellow,
                Colors.amber,
                Colors.orange,
                Colors.deepOrange,
                Colors.brown,
                Colors.grey,
                Colors.blueGrey,
                Colors.black,
              ])
                ListTile(
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: color,
                  ),
                  title: Text(color.toString()),
                  onTap: () {
                    onColorChanged(color);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}