import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_text.dart';
import 'package:aura_house/core/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isSvgg,
    required this.title,
    required this.onTap,
  });

  final bool isSvgg; // Assuming you want to use SVG by default
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isSvg = isSvgg;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          //borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg
                ? SvgPicture.asset("assets/svgs/shopping bag.svg")
                : SizedBox.shrink(),
            Gap(10),
            CustomText(text: title, spacing: 2),
          ],
        ),
      ),
    );
  }
}
