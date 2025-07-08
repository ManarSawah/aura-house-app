import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_text.dart';
import 'package:aura_house/components/custom_container.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Shipping Method".toUpperCase(),
          color: Color(0xFF888888),
          size: 14,
        ),
        Gap(15),

        CustomContainer(
          text: "Pickup at store",
          icon: Icons.keyboard_arrow_down_sharp,
          isFree: true,
        ),

        Gap(15),
      ],
    );
  }
}
