import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberController extends GetxController {
  final phoneNumberFocusNode = FocusNode();
  final phoneNumberController = TextEditingController();

  var phoneNumber = ''.obs;
  var countryCode = ''.obs;

  void setPhoneNumber(PhoneNumber number) {
    phoneNumber.value = number.phoneNumber ?? '';
    countryCode.value = number.dialCode ?? '';
  }

  String getPhoneNumber() {
    return phoneNumber.value;
  }

  @override
  void onClose() {
    phoneNumberFocusNode.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
