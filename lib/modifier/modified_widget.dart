import 'package:flutter/material.dart';
import 'package:modifier/modifier/modifier.dart';

/// Modified is a custom wrapper of any widget
class ModifiedWidget extends StatelessWidget {
  final Modifier modifier;
  final Widget child;

  const ModifiedWidget({
    super.key,
    required this.modifier,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Widget currentChild = child;
    for (var property in modifier.properties) {
      switch (property.key) {
        case PropertyKey.alpha:
          currentChild = Opacity(
            opacity: property.value,
            child: currentChild,
          );
          break;
        case PropertyKey.alignment:
          currentChild = Align(
            alignment: property.value,
            child: currentChild,
          );
          break;
        case PropertyKey.border:
          currentChild = Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(side: property.value),
            ),
            child: currentChild,
          );
          break;
        case PropertyKey.backgroundColor:
          currentChild = ColoredBox(
            color: property.value,
            child: currentChild,
          );
          break;
        case PropertyKey.backgroundShape:
          currentChild = Container(
            decoration: ShapeDecoration(
              shape: property.value,
            ),
            child: currentChild,
          );
          break;
        case PropertyKey.foregroundColor:
          currentChild = DefaultTextStyle(
            style: TextStyle(color: property.value),
            child: currentChild,
          );
          break;
        case PropertyKey.flex:
          currentChild = Expanded(
            flex: property.value,
            child: currentChild,
          );
          break;
        case PropertyKey.padding:
          currentChild = Padding(
            padding: property.value,
            child: currentChild,
          );
          break;
        case PropertyKey.margin:
          currentChild = Container(
            margin: property.value,
            child: currentChild,
          );
          break;
      }
    }
    return currentChild;
  }
}
