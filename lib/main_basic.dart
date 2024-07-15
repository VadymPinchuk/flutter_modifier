import 'dart:math';

import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: CustomWidget(),
//       ),
//     ),
//   );
// }

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: 500,
        itemBuilder: (context, index) {
          return Opacity(
            opacity: 0.8,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: _getColorFromIndex(index),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                      color: _getColorFromIndex(index - 250), width: 2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultTextStyle(
                  style: TextStyle(color: _getColorFromIndex(index - 500)),
                  child: Text('Hello, Flutter! $index'),
                ),
              ),
            ),
          );
        },
      );

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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex Screen without Modifiers'),
        ),
        body: const BasicScreen(),
      ),
    );
  }
}

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (int i = 0; i < 5; i++) ...[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Text('Hello, Flutter!'),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: const ShapeDecoration(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red, width: 2),
              ),
            ),
            child: const DefaultTextStyle(
              style: TextStyle(color: Colors.black),
              child: Text('Another text with modifiers'),
            ),
          ),
          const SizedBox(height: 16),
          Opacity(
            opacity: 0.8,
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Image.network('https://via.placeholder.com/150'),
            ),
          ),
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
          Opacity(
            opacity: 0.9,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const DefaultTextStyle(
                style: TextStyle(color: Colors.white),
                child: Text('Final modified widget in the list'),
              ),
            ),
          ),
          const Divider(),
        ],
      ],
    );
  }
}
