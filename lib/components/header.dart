import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_text.dart';
import 'package:aura_house/core/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Center(
          child: CustomText(
            text: title.toUpperCase(),
            color: AppColors.primary,
            size: 18,
            spacing: 4,
          ),
        ),
        Gap(10),
        Image.asset("assets/svgs/line.png", width: 180, color: Colors.black),
        Gap(20),
      ],
    );
  }
}
