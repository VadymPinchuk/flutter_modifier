import 'package:flutter/material.dart';

extension WidgetModifiers on Widget {
  Widget centered() {
    return Center(
      child: this,
    );
  }

  Widget withAlpha(double alpha) {
    return Opacity(
      opacity: alpha,
      child: this,
    );
  }

  Widget withBackground(Color color) {
    return ColoredBox(
      color: color,
      child: this,
    );
  }

  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget withMargin(EdgeInsetsGeometry margin) {
    return Container(
      margin: margin,
      child: this,
    );
  }

  Widget withForeground(Color color) {
    return DefaultTextStyle(
      style: TextStyle(color: color),
      child: this,
    );
  }

  Widget withBorder(BorderSide border) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(side: border),
      ),
      child: this,
    );
  }

  Widget withShapeDecoration(
          {Color? color, ShapeBorder? shape, BorderSide? borderSide}) =>
      Container(
        decoration: ShapeDecoration(
          color: color,
          shape: shape ??
              RoundedRectangleBorder(
                side: borderSide ?? BorderSide.none,
              ),
        ),
        child: this,
      );

  Widget withOpacity(double opacity) => Opacity(opacity: opacity, child: this);
}
