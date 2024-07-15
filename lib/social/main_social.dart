import 'package:flutter/material.dart';
import 'package:modifier/social/social.dart';
import 'package:modifier/social/socialized_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: VadymSocializedApp(),
      ),
    ),
  );
}

class VadymSocializedApp extends StatelessWidget {
  const VadymSocializedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Center(
          child: SocializedWidget(
            social: Social()
                .withX('@vad_pinchuk')
                .withLinkedIn('vpinchuk')
                .withInstagram('@vad.pinchuk'),
            child: const Text(
              'Vadym is happy to connect:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
