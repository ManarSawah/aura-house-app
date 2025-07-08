import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:aura_house/components/custom_appbar.dart';
import 'package:aura_house/components/custom_button.dart';
import 'package:aura_house/components/custom_field.dart';
import 'package:aura_house/components/header.dart';
import 'package:aura_house/core/extensions/responsive.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key, this.editData});
  final dynamic editData;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final fristNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fristNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.editData != null) {
      fristNameController.text = widget.editData['firstName'] ?? '';
      lastNameController.text = widget.editData['lastName'] ?? "";
      addressController.text = widget.editData['address'] ?? "";
      cityController.text = widget.editData['city'] ?? "";
      stateController.text = widget.editData['state'] ?? "";
      zipCodeController.text = widget.editData['zipCode'] ?? "";
      phoneNumberController.text = widget.editData['phoneNumber'] ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppbar(isBlackk: false),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w * 0.04),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: context.h * 0.04),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Header(title: "Add shipping adress"),
                    Gap(context.h * 0.025),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: context.w * 0.02),
                            child: CustomField(
                              label: "First Name",
                              controller: fristNameController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: context.w * 0.02),
                            child: CustomField(
                              label: "Last Name",
                              controller: lastNameController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(context.h * 0.025),
                    CustomField(
                      label: "Address",
                      controller: addressController,
                    ),
                    Gap(context.h * 0.025),
                    CustomField(label: "City", controller: cityController),
                    Gap(context.h * 0.025),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: context.w * 0.02),
                            child: CustomField(
                              label: "State",
                              controller: stateController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: context.w * 0.02),
                            child: CustomField(
                              label: "ZIP Code",
                              controller: zipCodeController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(context.h * 0.025),
                    CustomField(
                      label: "Phone Number",
                      controller: phoneNumberController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(
            context.w * 0.04,
            context.h * 0.015,
            context.w * 0.04,
            context.h * 0.03,
          ),
          child: CustomButton(
            isSvgg: false,
            title: "Add now".toUpperCase(),
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final data = {
                  "firstName": fristNameController.text,
                  "lastName": lastNameController.text,
                  "address": addressController.text,
                  "city": cityController.text,
                  "state": stateController.text,
                  "zipCode": zipCodeController.text,
                  "phoneNumber": phoneNumberController.text,
                };
                Navigator.pop(context, data);
              }
            },
          ),
        ),
      ),
    );
  }
}
