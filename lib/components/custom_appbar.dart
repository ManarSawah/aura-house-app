import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/core/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.isBlackk});
  final bool isBlackk;
  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    //bool isBlackk =true; // This can be replaced with a condition to check the theme or state
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: isBlackk ? AppColors.primary : Colors.white,
        centerTitle: true,
        leadingWidth: 35,
        leading: SvgPicture.asset(
          "assets/svgs/Menu.svg",

          colorFilter: ColorFilter.mode(
            isBlackk ? Colors.white : AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        title: SvgPicture.asset(
          "assets/logo/Aura.svg",
          height: 40,
          width: 50,
          colorFilter: ColorFilter.mode(
            isBlackk ? Colors.white : AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        actions: [
          SvgPicture.asset(
            "assets/svgs/Search.svg",
            colorFilter: ColorFilter.mode(
              isBlackk ? Colors.white : AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          Gap(20),
          SvgPicture.asset(
            "assets/svgs/shopping bag.svg",
            colorFilter: ColorFilter.mode(
              isBlackk ? Colors.white : AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
