import 'package:flutter/material.dart';
import 'package:modifier/extensions/main_extensions.dart';
import 'package:modifier/main_basic.dart';
import 'package:modifier/modifier/main_modifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Complex Screen Examples'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Basic'),
                Tab(text: 'Extensions'),
                Tab(text: 'Modifier'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              BasicScreen(),
              ExtensionsScreen(),
              ModifierScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
