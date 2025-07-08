import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/adress_info.dart';
import 'package:aura_house/components/cart_widget.dart';
import 'package:aura_house/components/custom_appbar.dart';
import 'package:aura_house/components/custom_button.dart';
import 'package:aura_house/components/custom_container.dart';
import 'package:aura_house/components/custom_text.dart';
import 'package:aura_house/components/dailog.dart';
import 'package:aura_house/components/header.dart';
import 'package:aura_house/components/shipping_method.dart';
import 'package:aura_house/core/colors.dart';
import 'package:aura_house/screens/add_address.dart';
import 'package:aura_house/screens/add_card.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  final String image;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final double totalPrice;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;
  dynamic _savedCard;
  late int selectedQty;

  @override
  void initState() {
    super.initState();
    selectedQty = widget.quantity;
  }

  void _openAddress(context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddAddress()),
    );

    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  void _editAdress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddAddress(editData: _savedAddress),
      ),
    );
    setState(() {
      _savedAddress = newAddress;
    });
  }

  void _openCard() async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCard()),
    );
    if (cardData != null) {
      setState(() {
        _savedCard = cardData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(isBlackk: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(title: "checkout"),
                    if (_savedAddress == null || _savedCard == null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Shipping Adress".toUpperCase(),
                            color: Color(0xFF888888),
                            size: 14,
                          ),
                          Gap(20),
                        ],
                      ),
                    if (_savedAddress != null)
                      Column(
                        children: [
                          AdressInfo(
                            savedAddress: _savedAddress,
                            onTap: _editAdress,
                          ),
                          Gap(15),
                        ],
                      ),
                    if (_savedAddress == null)
                      GestureDetector(
                        onTap: () {
                          _openAddress(context);
                        },
                        child: CustomContainer(
                          text: "Add shipping address",
                          icon: Icons.add,
                          isFree: false,
                        ),
                      ),
                    if (_savedAddress == null) Gap(35),

                    if (_savedAddress == null || _savedCard == null)
                      ShippingMethod(),

                    if (_savedAddress == null || _savedCard == null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(20),
                          CustomText(
                            text: "Payment method".toUpperCase(),
                            color: Color(0xFF888888),
                            size: 14,
                          ),
                          Gap(10),
                        ],
                      ),

                    if (_savedCard != null)
                      Column(
                        children: [
                          Divider(color: Colors.grey.shade300, thickness: 1.0),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svgs/Mastercard.svg"),
                              Gap(5),
                              CustomText(
                                text: "Master Card ending",
                                color: Colors.black,
                              ),
                              Gap(5),
                              CustomText(
                                text:
                                    "••••${_savedCard['cardNumber'].toString().substring(_savedCard['cardNumber'].toString().length - 2)}",
                                color: Colors.black,
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                "assets/svgs/arrow.svg",
                                width: 25,
                              ),
                            ],
                          ),
                          Gap(10),
                          Divider(color: Colors.grey.shade300, thickness: 1.0),
                        ],
                      ),
                    if (_savedCard == null)
                      GestureDetector(
                        onTap: _openCard,
                        child: CustomContainer(
                          text: "Select payment method",
                          icon: Icons.add,
                          isFree: false,
                        ),
                      ),

                    if (_savedAddress != null && _savedCard != null)
                      Column(
                        children: [
                          Gap(30),
                          CartWidget(
                            image: widget.image,
                            name: widget.name,
                            description: widget.description,
                            price: widget.price,
                            quantity: widget.quantity,
                            onChangeQuantity: (quantity) {
                              setState(() {
                                selectedQty = quantity;
                              });
                            },
                          ),
                          Gap(20),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Total".toUpperCase(),
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
                    isSvgg: false,
                    title: "Place order".toUpperCase(),
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(child: CustomDailog());
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
