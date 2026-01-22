import 'package:tdd_string_calculator/tdd_string_calculator.dart';

void main(List<String> arguments) {
  final calculator = StringCalculator();

  // Basic usage
  print(calculator.add(''));           // 0
  print(calculator.add('1'));          // 1
  print(calculator.add('1,2'));        // 3
  print(calculator.add('1,2,3,4,5'));  // 15

  // Newline delimiter
  print(calculator.add('1\n2,3'));     // 6

  // Custom delimiter
  print(calculator.add('//;\n1;2'));   // 3

  // Multi-character delimiter
  print(calculator.add('//[***]\n1***2***3'));  // 6

  // Multiple delimiters
  print(calculator.add('//[*][&]\n1*2&3'));     // 6

  // Input validation - empty parts ignored
  print(calculator.add('1,,3'));       // 4

  // Negative numbers throw exception
  try {
    calculator.add('-1,2,-3');
  } catch (e) {
    print(e);  // Exception: negative numbers not allowed -1,-3
  }
}
