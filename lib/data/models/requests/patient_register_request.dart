import 'package:json_annotation/json_annotation.dart';

part 'patient_register_request.g.dart';

@JsonSerializable()
class PatientRegisterRequest {
  PatientRegisterRequest({
   required this.name,
  required this.excecutive,
  required this.payment,
  required this.phone,
  required this.address,
  required this.total_amount,
  required this.discount_amount,
  required this.advance_amount,
  required this.balance_amount,
  required this.date_nd_time,
  required this.id,
  required this.male,
  required this.female,
  required this.branch,
  required this.treatments
  });

  factory PatientRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$PatientRegisterRequestFromJson(json);
  final String name;
  final String excecutive;
  final String payment;
  final String phone;
  final String address;
  final double total_amount;
  final double discount_amount;
  final double advance_amount;
  final double balance_amount;
  final String date_nd_time;
  final String id;
  final List<int> male;
  final List<int> female;
  final String branch;
  final List<int> treatments;

  Map<String, dynamic> toJson() => _$PatientRegisterRequestToJson(this);
}
