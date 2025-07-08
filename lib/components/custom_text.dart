import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size = 15.0,
    this.color = Colors.white,
    this.weight = FontWeight.normal,
    this.max = 1,
    this.height = 1,
    this.spacing = 1.0,
  });
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final int max;
  final double height;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: max,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: "TenorSans",
        height: height,
        letterSpacing: spacing,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
