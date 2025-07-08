import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/cart_widget.dart';
import 'package:aura_house/components/custom_appbar.dart';
import 'package:aura_house/components/custom_button.dart';
import 'package:aura_house/components/custom_text.dart';
import 'package:aura_house/components/header.dart';
import 'package:aura_house/core/colors.dart';
import 'package:aura_house/screens/place_order.dart';

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.descrp,
  });
  final String image;
  final String name;
  final double price;
  final String descrp;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(isBlackk: false), // Custom app bar with black theme
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Header(title: "checkout"),
            CartWidget(
              name: widget.name,
              image: widget.image,
              price: widget.price,
              description: widget.descrp,
              quantity: selectedQty,
              onChangeQuantity: (value) {
                // Handle quantity change if needed
                setState(() {
                  selectedQty = value;
                });
              },
            ),
            promocode(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Est. Total".toUpperCase(),
                  color: AppColors.primary,
                ),
                CustomText(
                  text: "\$ ${widget.price * selectedQty}",
                  color: Colors.red.shade200,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            Gap(20),
            CustomButton(
              isSvgg: true,
              title: "Checkout".toUpperCase(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => PlaceOrder(
                          image: widget.image,
                          name: widget.name,
                          description: widget.descrp,
                          price: widget.price,
                          quantity: selectedQty,
                          totalPrice:
                              widget.price *
                              selectedQty, // Total price calculation
                        ),
                  ),
                );
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}

Widget promocode() {
  return Column(
    children: [
      Gap(20),
      Divider(color: Colors.grey.shade300, thickness: 1.0),
      Gap(20),
      Row(
        children: [
          SvgPicture.asset("assets/svgs/promo.svg", width: 26),
          Gap(20),
          CustomText(text: ("Add Promo Code"), color: AppColors.primary),
        ],
      ),
      Gap(20),
      Divider(color: Colors.grey.shade300, thickness: 1.0),
      Gap(20),
      Row(
        children: [
          SvgPicture.asset("assets/svgs/delivery.svg", width: 23),
          Gap(20),
          CustomText(text: ("Delivery"), color: AppColors.primary),
          Spacer(),
          CustomText(text: "FREE", color: AppColors.primary),
        ],
      ),
      Gap(20),
      Divider(color: Colors.grey.shade300, thickness: 1.0),
      Gap(20),
    ],
  );
}
