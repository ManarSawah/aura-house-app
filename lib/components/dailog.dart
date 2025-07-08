import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_button.dart';
import 'package:aura_house/components/custom_text.dart';

class CustomDailog extends StatelessWidget {
  const CustomDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(CupertinoIcons.clear),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Gap(20),

            CustomText(
              text: "Peyment success".toUpperCase(),
              color: Colors.black,
            ),
            Gap(20),
            SizedBox(
              width: 80,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      "assets/svgs/shine.svg",
                      height: 25,
                    ),
                  ),
                  SvgPicture.asset("assets/pop/done.svg"),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset("assets/svgs/shine.svg"),
                  ),
                ],
              ),
            ),
            Gap(20),
            CustomText(
              text: "Your payment was success".toUpperCase(),
              color: Colors.black,
            ),
            Gap(10),
            CustomText(
              text: "Payment ID : 15263541".toUpperCase(),
              color: Colors.black,
            ),
            Gap(20),
            Image.asset(
              "assets/svgs/line.png",
              width: 150,
              color: Colors.black54,
            ),
            Gap(20),
            CustomText(
              text: "Rate your purchase".toUpperCase(),
              color: Colors.black,
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/pop/emogi1.svg"),
                Gap(10),
                SvgPicture.asset("assets/pop/emogi2.svg"),
                Gap(10),
                SvgPicture.asset("assets/pop/emogi3.svg"),
              ],
            ),
            Gap(20),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    isSvgg: false,
                    title: "submit".toUpperCase(),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Gap(10),
                Expanded(
                  child: CustomButton(
                    isSvgg: false,
                    title: "cancel".toUpperCase(),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
