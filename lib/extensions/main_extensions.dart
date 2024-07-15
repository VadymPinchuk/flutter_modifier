import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modifier/extensions/widget_extensions.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: CustomWidget(),
      ),
    ),
  );
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) => textWidget();

  // ListView.builder(
  //       itemCount: 500,
  //       itemBuilder: (context, index) {
  //         // return textWidget();
  //         return Text('Hello, Extended Flutter! $index')
  //             .withPadding(const EdgeInsets.all(16))
  //             .withBackground(
  //           _getColorFromIndex(index),
  //         )
  //             .withBorder(
  //               BorderSide(color: _getColorFromIndex(index - 250), width: 5),
  //             )
  //             .withMargin(const EdgeInsets.all(8))
  //             .withForeground(_getColorFromIndex(index - 500));
  //       },
  //     );

  Widget textWidget() {
    return const Text('Hello, Extended Flutter!')
        .withPadding(const EdgeInsets.all(16))
        .withBackground(Colors.blue)
        .withPadding(const EdgeInsets.all(64));
  }

  Color _getColorFromIndex(int index) {
    final Random random = Random(index);
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}

class ExtensionsScreen extends StatelessWidget {
  const ExtensionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (int i = 0; i < 5; i++) ...[
          const Text('Hello, Flutter!')
              .withPadding(const EdgeInsets.all(16))
              .withShapeDecoration(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
          const SizedBox(height: 16),
          const Text('Another text with modifiers')
              .withPadding(const EdgeInsets.all(16))
              .withMargin(const EdgeInsets.symmetric(vertical: 8))
              .withShapeDecoration(
                  color: Colors.green,
                  borderSide: const BorderSide(color: Colors.red, width: 2)),
          const SizedBox(height: 16),
          Image.network('https://via.placeholder.com/150')
              .withPadding(const EdgeInsets.all(8))
              .withMargin(const EdgeInsets.all(16))
              .withShapeDecoration(
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))
              .withOpacity(0.8),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(4),
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(4),
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(4),
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Final modified widget in the list')
              .withPadding(const EdgeInsets.all(16))
              .withShapeDecoration(
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))
              .withOpacity(0.9),
          const Divider(),
        ],
      ],
    );
  }
}
