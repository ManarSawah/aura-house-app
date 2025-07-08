import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_appbar.dart';
import 'package:aura_house/components/custom_button.dart';
import 'package:aura_house/components/header.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cvvCode = '';
  String cardName = '';
  final _formKey = GlobalKey<FormState>();

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(isBlackk: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Header(title: "Payment method"),

                //visa
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardName,
                  cvvCode: cvvCode,
                  showBackView: showBackView,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: Color(0xFF283593),
                  isHolderNameVisible: true,
                ),

                //form
                CreditCardForm(
                  formKey: _formKey,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                ),
                Gap(20),
                CustomButton(
                  isSvgg: false,
                  title: "Place order".toUpperCase(),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar with the form value
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Payment method saved.")),
                      );
                      final data = {
                        "cardNumber": cardNumber,
                        "expiryDate": expiryDate,
                        "cardHolderName": cardName,
                        "cvv": cvvCode,
                      };
                      Navigator.pop(context, data);
                    }
                  },
                ),
                //Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardName = data.cardHolderName;
      expiryDate = data.expiryDate;
      cvvCode = data.cvvCode;
      showBackView = data.isCvvFocused;
    });
  }
}
