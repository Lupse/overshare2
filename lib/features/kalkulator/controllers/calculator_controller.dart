import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var result = '0'.obs;
  var userInput = ''.obs;
  double num_1 = 0;
  double num_2 = 0;

  String _input = '';
  String _operator = '';

  //method user input
  void input(String value) {
    if (value == 'C') {
      cleanNumber();
    } else if (value == '=') {
      calculate();
    } else if (value == '+' || value == '-' || value == 'x' || value == '/') {
      setOperator(value);
    } else if (value == 'backspace') {
      backspace();
    } else if (value == '%') {
      percent();
    } else {
      appendInput(value);
    }
  }

  //method calculate
  void calculate() {
    //error handling when user input operator first
    if (_operator.isEmpty || _input.isEmpty) {
      return;
    }

    num_2 = double.tryParse(_input) ?? 0;

    if (_operator == '+') {
      num_1 += num_2;
    } else if (_operator == '-') {
      num_1 -= num_2;
    } else if (_operator == 'x') {
      num_1 *= num_2;
    } else if (_operator == '/') {
      num_1 = (num_2 != 0) ? num_1 / num_2 : double.nan;
    }

    //update result
    result.value = num_1.toString();
    //clear input for next entry
    _input = '';
    userInput.value = '';
  }

  //method clean
  void cleanNumber() {
    _input = '';
    num_1 = 0;
    num_2 = 0;
    _operator = '';
    userInput.value = '';
    result.value = '0';
  }

  //method append operator and input
  void appendInput(String value) {
    _input += value;
    userInput.value = _input;
  }

  //method set operator
  void setOperator(String operator) {
    if (_input.isNotEmpty) {
      //store current number di num_1
      num_1 = double.tryParse(_input) ?? 0;
      result.value = num_1.toString();
    }
    _operator = operator;
    _input = '';
    //munculin operator di layar
    userInput.value = '';
  }

  void backspace() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
      userInput.value = _input;
    }
  }

  void percent() {
    if (_input.isNotEmpty) {
      double percentageValue = double.parse(_input.replaceAll(',', '')) / 100;
      result.value = percentageValue.toString();
      userInput.value = percentageValue.toString();
    }
  }
}
