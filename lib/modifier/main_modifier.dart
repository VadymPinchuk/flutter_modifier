import 'package:flutter/material.dart';
import 'package:modifier/modifier/modified_widget.dart';
import 'package:modifier/modifier/modifier.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: NotModifiedWidgetTree(),
      ),
    ),
  );
}

class ModifiedWidgetTree extends StatelessWidget {
  const ModifiedWidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ModifiedWidget(
      modifier: Modifier()
          .withPadding(const EdgeInsets.all(4))
          .withAlpha(0.75)
          .withBackground(const Color(0xFF44D1FD))
          .withPadding(const EdgeInsets.all(12))
          .withBackground(const Color(0xFFFF5641))
          .withPadding(const EdgeInsets.all(12))
          .withBackground(const Color(0xFF3EE4C5))
          .withForeground(const Color(0xFFFF5641))
          .withAlignment(AlignmentDirectional.center),
      child: const Text(
        'Hello, Modified Flutter!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class NotModifiedWidgetTree extends StatelessWidget {
  const NotModifiedWidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: AlignmentDirectional.center,
      child: DefaultTextStyle(
        style: TextStyle(color: Color(0xFFFF5641)),
        child: ColoredBox(
          color: Color(0xFF3EE4C5),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ColoredBox(
              color: Color(0xFFFF5641),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ColoredBox(
                  color: Color(0xFF44D1FD),
                  child: Opacity(
                    opacity: 0.75,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        'Hello, Modified Flutter!',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex Screen with Modifiers'),
        ),
        body: const ModifierScreen(),
      ),
    );
  }
}

class ModifierScreen extends StatelessWidget {
  const ModifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (int i = 0; i < 5; i++) ...[
          ModifiedWidget(
            modifier: Modifier()
                .withPadding(const EdgeInsets.all(16))
                .withBackground(Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
            child: const Text('Hello, Flutter!'),
          ),
          const SizedBox(height: 16),
          ModifiedWidget(
            modifier: Modifier()
                .withPadding(const EdgeInsets.all(16))
                .withMargin(const EdgeInsets.symmetric(vertical: 8))
                .withBackground(Colors.green)
                .withBorder(const BorderSide(color: Colors.red, width: 2)),
            child: const Text('Another text with modifiers'),
          ),
          const SizedBox(height: 16),
          ModifiedWidget(
            modifier: Modifier()
                .withPadding(const EdgeInsets.all(8))
                .withMargin(const EdgeInsets.all(16))
                .withBackground(Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)))
                .withAlpha(0.8),
            child: Image.network('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ModifiedWidget(
                  modifier: Modifier()
                      .withMargin(const EdgeInsets.all(4))
                      .withBackground(Colors.red),
                  child: Container(height: 50),
                ),
              ),
              Expanded(
                child: ModifiedWidget(
                  modifier: Modifier()
                      .withMargin(const EdgeInsets.all(4))
                      .withBackground(Colors.blue),
                  child: Container(height: 50),
                ),
              ),
              Expanded(
                child: ModifiedWidget(
                  modifier: Modifier()
                      .withMargin(const EdgeInsets.all(4))
                      .withBackground(Colors.green)
                      .withMargin(const EdgeInsets.all(8)),
                  child: Container(height: 50),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ModifiedWidget(
            modifier: Modifier()
                .withPadding(const EdgeInsets.all(16))
                .withBackground(Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))
                .withAlpha(0.9),
            child: const Text('Final modified widget in the list'),
          ),
          const Divider(),
        ],
      ],
    );
  }
}
