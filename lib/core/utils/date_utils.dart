import 'package:intl/intl.dart';

String formatDateForPatients(String date) {
  if (date.isEmpty) return '';
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat("dd MMM, yyyy");
  return formatter.format(parsedDate);
}

String getFormattedDateTime(
  DateTime? selectedDate,
  String? selectedHour,
  String? selectedMinute,
) {
  if (selectedDate == null || selectedHour == null || selectedMinute == null) {
    return '';
  }

  int hour = int.parse(selectedHour);
  int minute = int.parse(selectedMinute);

  final dateTime = DateTime(
    selectedDate.year,
    selectedDate.month,
    selectedDate.day,
    hour,
    minute,
  );

  final datePart = DateFormat('dd/MM/yyyy').format(dateTime);

  final timePart =
      '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

  return '$datePart-$timePart AM';
}
