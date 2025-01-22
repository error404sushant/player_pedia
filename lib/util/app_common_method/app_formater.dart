class AppFormater {
  /// Formats a DateTime object into a readable string.
  /// Example: January 15, 2025
  static String formatDate(DateTime date) {
    return '${_monthName(date.month)} ${date.day}, ${date.year}';
  }

  /// Converts a 10-digit mobile number into the format +91XXXXXXXXXX.
  /// If the input is already in a valid format, it returns the same.
  static String formatMobileNumber(String number) {
    if (number.length == 10 && RegExp(r'^\d{10}$').hasMatch(number)) {
      return '+91$number';
    } else if (number.startsWith('+91') && number.length == 13) {
      return number;
    } else {
      throw ArgumentError('Invalid mobile number format');
    }
  }

  /// Private helper to get the month name.
  static String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  /// Trims whitespace and capitalizes the first letter of each word.
  /// Example: "hello world" -> "Hello World"
  static String capitalizeWords(String text) {
    return text
        .trim()
        .split(' ')
        .map((word) => word.isNotEmpty
        ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
        : '')
        .join(' ');
  }

  /// Formats a currency value.
  /// Example: 12345 -> ₹12,345.00
  static String formatCurrency(double amount) {
    return '₹${amount.toStringAsFixed(2).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
    )}';
  }

  /// Formats a list of strings into a readable sentence.
  /// Example: ["Apple", "Banana", "Cherry"] -> "Apple, Banana, and Cherry"
  static String formatListToSentence(List<String> items) {
    if (items.isEmpty) return '';
    if (items.length == 1) return items.first;
    return '${items.sublist(0, items.length - 1).join(', ')} and ${items.last}';
  }
}
