import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_text.dart';

class CustomContainer extends StatelessWidget {
  final dynamic text;
  final IconData icon;
  final bool isFree;

  const CustomContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(54),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: text, color: Colors.black, size: 14),
          const Spacer(),
          isFree
              ? const CustomText(text: "FREE", color: Colors.black)
              : const SizedBox.shrink(),
          const Gap(15),
          Icon(icon),
        ],
      ),
    );
  }
}
