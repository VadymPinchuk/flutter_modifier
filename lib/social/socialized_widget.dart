import 'package:flutter/widgets.dart';
import 'package:modifier/social/social.dart';

/// By example of ModifiedWidget , using Social class, lets make a SocializedWidget
/// Each Contact will be wrapping the child with a column and add a new row with contact details
class SocializedWidget extends StatelessWidget {
  final Social social;
  final Widget child;

  const SocializedWidget({
    super.key,
    required this.social,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Widget currentChild = child;
    for (var contact in social.contacts) {
      currentChild = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          currentChild,
          Text(
            '✓ ${contact.key.name}: ${contact.value}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      );
    }
    return currentChild;
  }
}
