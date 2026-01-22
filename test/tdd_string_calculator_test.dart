import 'package:tdd_string_calculator/tdd_string_calculator.dart';
import 'package:test/test.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  test('returns 0 for empty string', () {
    expect(calculator.add(''), equals(0));
  });

  test('returns number itself for single number', () {
    expect(calculator.add('1'), equals(1));
  });

  test('returns sum of two comma separated numbers', () {
    expect(calculator.add('1,5'), equals(6));
  });

  test('handles any amount of numbers', () {
    expect(calculator.add('1,2,3,4'), equals(10));
  });

  test('handles new lines between numbers', () {
    expect(calculator.add('1\n2,3'), equals(6));
  });

  test('supports custom delimiter', () {
    expect(calculator.add('//;\n1;2'), equals(3));
  });

  test('supports multi-character delimiter', () {
    expect(calculator.add('//[*]\n1*2*3'), equals(6));
  });

  test('supports multiple delimiters', () {
    expect(calculator.add('//[*][&]\n1*2&3'), equals(6));
  });

  test('supports multiple multi-character delimiters', () {
    expect(calculator.add('//[**][&&]\n1**2&&3'), equals(6));
  });

  test('throws exception for single negative number', () {
    expect(
          () => calculator.add('1,-2'),
      throwsA(predicate((e) => e is Exception && e.toString().contains('negative numbers not allowed -2'))),
    );
  });

  test('throws exception listing all negative numbers', () {
    expect(
          () => calculator.add('1,-2,-3'),
      throwsA(predicate((e) => e is Exception && e.toString().contains('negative numbers not allowed -2,-3'))),
    );
  });

  test('throws exception for invalid input', () {
    expect(() => calculator.add('1,a,3'), throwsA(isA<FormatException>()));
  });

  test('ignores empty parts between delimiters', () {
    expect(calculator.add('1,,2'), equals(3));
    expect(calculator.add(',1,2,'), equals(3));
  });
}