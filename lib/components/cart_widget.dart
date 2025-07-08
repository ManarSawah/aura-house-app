import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_text.dart';
import 'package:aura_house/core/colors.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.onChangeQuantity,
    required this.quantity,
  });
  final String image, name, description;
  final double price;
  final Function(int) onChangeQuantity;
  final int quantity;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late int number;

  @override
  void initState() {
    super.initState();
    number = 1;
    number = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.image, width: 140),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(text: widget.name, spacing: 5, color: AppColors.primary),
            Gap(10),
            SizedBox(
              width: size.width * 0.5,
              child: CustomText(
                text: widget.description,
                size: 12,
                spacing: 2,
                color: AppColors.primary,
              ),
            ),

            Gap(40),
            Row(
              children: [
                quantity(() {
                  if (number > 1) {
                    setState(() {
                      number--;
                      widget.onChangeQuantity(number);
                    });
                  }
                }, "assets/svgs/min.svg"),
                Gap(15),
                CustomText(
                  text: "$number",
                  weight: FontWeight.bold,
                  size: 20,
                  color: AppColors.primary,
                ),
                Gap(15),
                quantity(() {
                  setState(() {
                    number++;
                    widget.onChangeQuantity(number);
                  });
                }, "assets/svgs/plus.svg"),
              ],
            ),
            Gap(40),
            CustomText(
              text: "\$ ${widget.price}",
              size: 20,
              weight: FontWeight.bold,
              color: Colors.red.shade200,
            ),
          ],
        ),
      ],
    );
  }
}

Widget quantity(onTap, svg) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400, width: 1.5),
      ),
      child: SvgPicture.asset(svg),
    ),
  );
}
