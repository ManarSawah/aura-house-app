import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:aura_house/components/custom_text.dart';
import 'package:aura_house/models/cover_model.dart';
import 'package:aura_house/models/product_model.dart';
import 'package:aura_house/components/custom_appbar.dart';
import 'package:aura_house/core/colors.dart';
import 'package:aura_house/screens/checkout.dart';
import 'package:aura_house/core/extensions/responsive.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      // Custom app bar
      appBar: CustomAppbar(isBlackk: true),

      body: Stack(
        children: [
          // Decorative heading SVG
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/10.svg"),
          ),

          // Main scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.w * 0.04),
                  child: Column(
                    children: [
                      Gap(context.h * 0.01),

                      // Page subtitle and title
                      CustomText(
                        text: "Step into style".toUpperCase(),
                        size: context.h * 0.022,
                        weight: FontWeight.w500,
                        color: Colors.white24,
                        spacing: 1.5,
                      ),
                      Gap(context.h * 0.005),
                      CustomText(
                        text: "Lumière Collection".toUpperCase(),
                        size: context.h * 0.025,
                        color: Colors.white,
                        spacing: 2,
                      ),
                      Gap(context.h * 0.03),

                      // Main cover image with rotated label
                      Stack(
                        children: [
                          Image.asset(
                            "assets/cover/cover1.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 10,
                            right: 0,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Row(
                                children: [
                                  Container(
                                    width: context.w * 1,
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  Gap(10),
                                  CustomText(
                                    color: const Color(0xFFFFFFFF),
                                    text: "NEW COLLECTION",
                                    size: 30,
                                    spacing: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Gap(context.h * 0.05),

                      // Grid list of products
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: ProductModel.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: context.w * 0.04,
                          childAspectRatio: 0.50,
                        ),
                        itemBuilder: (context, index) {
                          final item = ProductModel.products[index];
                          return GestureDetector(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (c) => Checkout(
                                          image: item.image,
                                          name: item.name,
                                          price: item.price,
                                          descrp: item.description,
                                        ),
                                  ),
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(item.image, fit: BoxFit.cover),
                                Gap(10),
                                CustomText(text: item.name),
                                CustomText(
                                  text: item.description,
                                  color: Colors.grey,
                                ),
                                Gap(6),
                                CustomText(
                                  text: "\$ ${item.price.toString()}",
                                  color: Colors.red.shade200,
                                  size: 18,
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      // Section title
                      CustomText(
                        text: "You may also like".toUpperCase(),
                        size: 25,
                      ),
                      Gap(context.h * 0.02),
                      Image.asset(
                        "assets/svgs/line.png",
                        width: context.w * 0.45,
                      ),
                      Gap(context.h * 0.02),

                      // Horizontal list of cover items
                      SizedBox(
                        height: context.h * 0.65,
                        width: context.w,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: CoverModel.covers.length,
                          itemBuilder: (context, index) {
                            final item = CoverModel.covers[index];
                            return Padding(
                              padding: EdgeInsets.all(context.w * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    item.image,
                                    height: context.h * 0.52,
                                    fit: BoxFit.cover,
                                  ),
                                  Gap(10),
                                  CustomText(
                                    text: item.title.toUpperCase(),
                                    size: context.w * 0.05,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      // Footer section
                      about(context),
                    ],
                  ),
                ),

                // Copyright text
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade400,
                  child: Padding(
                    padding: EdgeInsets.all(context.h * 0.0002),
                    child: Center(
                      child: CustomText(
                        height: 2.4,
                        color: const Color(0xFFFFFFFF),
                        text: "Copyright© OpenUI All Rights Reserved.",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Footer with contact info and social media icons
Widget about(BuildContext context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.logo_facebook, color: Colors.white),
            Gap(context.w * 0.08),
            Icon(Ionicons.logo_instagram, color: Colors.white),
            Gap(context.w * 0.08),
            Icon(Ionicons.logo_twitter, color: Colors.white),
          ],
        ),
        Gap(context.h * 0.03),
        Image.asset("assets/svgs/line.png", width: context.w * 0.45),
        Gap(context.h * 0.03),
        CustomText(
          max: 3,
          height: 2.5,
          text:
              "support@openui.design\n       +60 825 876 \n 08:00 - 22:00 - Everyday",
        ),
        Gap(context.h * 0.03),
        Image.asset("assets/svgs/line.png", width: context.w * 0.45),
        Gap(context.h * 0.03),
        CustomText(height: 2.5, text: "About        Contact        Blog"),
      ],
    ),
  );
}
