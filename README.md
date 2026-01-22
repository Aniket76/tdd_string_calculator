# String Calculator TDD Kata

[![Dart](https://img.shields.io/badge/Dart-3.9.0-blue.svg)](https://dart.dev)
[![TDD](https://img.shields.io/badge/Methodology-TDD-green.svg)](https://en.wikipedia.org/wiki/Test-driven_development)
[![Tests](https://img.shields.io/badge/Tests-13%20Passing-brightgreen.svg)]()

This repository contains an implementation of the **String Calculator TDD Kata**, written in Dart following **Test-Driven Development (TDD) principles**.

The objective of this exercise is to demonstrate software craftsmanship by focusing on:

- Clean and readable code
- Small, well-defined functions
- Comprehensive unit tests
- Incremental development driven by tests

## Problem Statement

Create a calculator with a method:

```dart
int add(String numbers)
```

The method takes a string containing numbers separated by delimiters and returns their sum, while following a specific set of rules described below. The implementation follows **TDD**.

### Why TDD?

- **Confidence**: Every line of code is covered by tests
- **Design**: Tests drive better API design
- **Documentation**: Tests serve as living documentation
- **Maintainability**: Refactoring is safe with comprehensive test coverage

---

## Features Implemented

| # | Feature | Description | Example |
|---|---------|-------------|---------|
| 1 | Empty String | Returns `0` for empty input | `add("")` → `0` |
| 2 | Single Number | Returns the number itself | `add("1")` → `1` |
| 3 | Two Numbers | Sum of comma-separated numbers | `add("1,2")` → `3` |
| 4 | Multiple Numbers | Handles any amount of numbers | `add("1,2,3,4,5")` → `15` |
| 5 | Newline Delimiter | Supports `\n` as delimiter | `add("1\n2,3")` → `6` |
| 6 | Custom Delimiter | Supports `//[delimiter]\n` syntax | `add("//;\n1;2")` → `3` |
| 7 | Multi-char Delimiter | Supports `//[***]\n` syntax | `add("//[***]\n1***2")` → `3` |
| 8 | Multiple Delimiters | Supports `//[*][&]\n` syntax | `add("//[*][%]\n1*2&3")` → `6` |
| 9 | Input Validation | Handles empty parts gracefully | `add("1,,3")` → `4` |
| 10 | Negative Numbers | Throws exception listing all negatives | `add("-1,2,-3")` → Exception |

---

## Usage Examples

```dart
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
```

---

## Running Tests

```bash
# Run all tests
dart test

# Run tests with verbose output
dart test --reporter expanded

# Run with coverage
dart test --coverage
```

---

## Test Results

```
00:00 +0: loading /Users/avishal/Desktop/personal/tdd_string_calculator/test/tdd_string_calculator_test.dart
00:00 +0: returns 0 for empty string
00:00 +1: returns number itself for single number
00:00 +2: returns sum of two comma separated numbers
00:00 +3: handles any amount of numbers
00:00 +4: handles new lines between numbers
00:00 +5: supports custom delimiter
00:00 +6: supports multi-character delimiter
00:00 +7: supports multiple delimiters
00:00 +8: supports multiple multi-character delimiters
00:00 +9: throws exception for single negative number
00:00 +10: throws exception listing all negative numbers
00:00 +11: throws exception for invalid input
00:00 +12: ignores empty parts between delimiters
00:00 +13: All tests passed!
```

---

## Requirements

- **Dart SDK**: ^3.9.0


## Getting Started

```bash
# Clone the repository
git clone https://github.com/Aniket76/tdd_string_calculator.git

# Navigate to project
cd string_calculator

# Get dependencies
dart pub get

# Run tests
dart test --reporter expanded
```

---

## Author

**Aniket Vishal**

---

## License

This project is open source and available under the [MIT License](LICENSE).