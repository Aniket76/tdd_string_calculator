class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final parsedInput = _parseInput(numbers);
    final values = _convertToNumbers(parsedInput);

    _throwIfNegatives(values);

    return _sumValidNumbers(values);
  }

  /// Parses the input and returns a list of number strings
  List<String> _parseInput(String input) {
    final delimiters = _extractDelimiters(input);
    final numbersPart = _removeDelimiterDefinition(input);

    var normalized = numbersPart;
    for (final delimiter in delimiters) {
      normalized = normalized.replaceAll(delimiter, ',');
    }

    normalized = normalized.replaceAll('\n', ',');

    return normalized.split(',').where((s) => s.isNotEmpty).toList();
  }

  /// Extracts delimiters from the input
  List<String> _extractDelimiters(String input) {
    if (!input.startsWith('//')) {
      return [','];
    }

    final delimiterSection = input.substring(2, input.indexOf('\n'));

    if (delimiterSection.startsWith('[')) {
      final regex = RegExp(r'\[([^\]]+)\]');
      return regex
          .allMatches(delimiterSection)
          .map((m) => m.group(1)!)
          .toList();
    }

    return [delimiterSection];
  }

  /// Removes the delimiter definition line, if present
  String _removeDelimiterDefinition(String input) {
    if (!input.startsWith('//')) return input;
    return input.substring(input.indexOf('\n') + 1);
  }

  /// Converts string values to integers
  List<int> _convertToNumbers(List<String> parts) {
    return parts.map(int.parse).toList();
  }

  /// Throws exception if negative numbers are present
  void _throwIfNegatives(List<int> numbers) {
    final negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }
  }

  /// Sums numbers less than or equal to 1000
  int _sumValidNumbers(List<int> numbers) {
    return numbers.fold(0, (sum, n) => sum + n);
  }
}