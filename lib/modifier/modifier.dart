import 'package:collection/collection.dart' show ListEquality;
import 'package:flutter/painting.dart';

typedef Property = ({PropertyKey key, dynamic value});

enum PropertyKey {
  alpha,
  alignment,
  border,
  backgroundColor,
  backgroundShape,
  foregroundColor,
  flex,
  padding,
  margin,
}

class Modifier {
  final List<Property> properties;

  Modifier({
    List<Property>? properties,
  }) : properties = properties ?? List.empty();

  Modifier _copyWith(PropertyKey key, dynamic value) {
    final newProps = [...properties, (key: key, value: value)];
    return Modifier(properties: newProps);
  }

  Modifier withAlpha(double alpha) {
    return _copyWith(PropertyKey.alpha, alpha);
  }

  Modifier withAlignment(AlignmentGeometry alignment) {
    return _copyWith(PropertyKey.alignment, alignment);
  }

  Modifier withBackground(Color color, {ShapeBorder? shape}) {
    final modifier = _copyWith(PropertyKey.backgroundColor, color);
    if (shape != null) {
      return modifier._copyWith(PropertyKey.backgroundShape, shape);
    }
    return modifier;
  }

  Modifier withBorder(BorderSide border) {
    return _copyWith(PropertyKey.border, border);
  }

  Modifier withForeground(Color color) {
    return _copyWith(PropertyKey.foregroundColor, color);
  }

  Modifier withFlex(int flex) {
    return _copyWith(PropertyKey.flex, flex);
  }

  Modifier withMargin(EdgeInsetsGeometry margin) {
    return _copyWith(PropertyKey.margin, margin);
  }

  Modifier withPadding(EdgeInsetsGeometry padding) {
    return _copyWith(PropertyKey.padding, padding);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Modifier &&
        const ListEquality().equals(other.properties, properties);
  }

  @override
  int get hashCode {
    return const ListEquality().hash(properties);
  }

  @override
  String toString() {
    return properties.toString();
  }
}
