import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_text.dart';

class AdressInfo extends StatelessWidget {
  const AdressInfo({super.key, this.savedAddress, this.onTap});
  final dynamic savedAddress;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              CustomText(
                text:
                    "${savedAddress['firstName'] ?? ''} ${savedAddress['lastName'] ?? ''}"
                        .toUpperCase(),
                color: Color(0xFF1A1A1A),
                size: 18,
              ),
              Gap(10),
              CustomText(
                text: savedAddress['address'] ?? '',
                color: Color(0xFF555555),
                size: 14,
              ),
              Gap(10),
              CustomText(
                text: savedAddress['city'] ?? '',
                color: Color(0xFF555555),
                size: 14,
              ),
              Gap(10),
              CustomText(
                text:
                    "${savedAddress['state'] ?? ''} ${savedAddress['zipCode'] ?? ''}",
                color: Color(0xFF555555),
                size: 14,
              ),
              Gap(10),
              CustomText(
                text: savedAddress['phoneNumber'] ?? '',
                color: Color(0xFF555555),
                size: 14,
              ),
            ],
          ),
          SvgPicture.asset("assets/svgs/arrow.svg", width: 25),
        ],
      ),
    );
  }
}
