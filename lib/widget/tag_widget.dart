import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleTagWidget extends StatelessWidget {
  const SimpleTagWidget(
    this.content, {
    Key key,
    this.child,
    this.padding = const EdgeInsets.fromLTRB(15.0, 6, 15.0, 6),
    this.color = Colors.black,
    this.borderRadius = 0.0,
    this.borderColor = Colors.transparent,
    this.fontSize = 14.0,
    this.borderWidth = 1.0,
  }) : super(key: key);

  final Color color;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final double fontSize;

  final Widget child;
  final String content;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: child ??
          Text(
            content ?? "",
            style: TextStyle(
              color: color,
              fontSize: fontSize,
            ),
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          width: borderWidth ,
          color: borderColor ,
        ),
      ),
    );
  }
}
