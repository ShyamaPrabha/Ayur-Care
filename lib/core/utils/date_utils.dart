import 'package:intl/intl.dart';

String formatDateForPatients(String date) {
  if (date.isEmpty) return '';
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat("dd MMM, yyyy");
  return formatter.format(parsedDate);
}
