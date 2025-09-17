// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientRegisterRequest _$PatientRegisterRequestFromJson(
  Map<String, dynamic> json,
) => PatientRegisterRequest(
  name: json['name'] as String,
  excecutive: json['excecutive'] as String,
  payment: json['payment'] as String,
  phone: json['phone'] as String,
  address: json['address'] as String,
  total_amount: (json['total_amount'] as num).toDouble(),
  discount_amount: (json['discount_amount'] as num).toDouble(),
  advance_amount: (json['advance_amount'] as num).toDouble(),
  balance_amount: (json['balance_amount'] as num).toDouble(),
  date_nd_time: json['date_nd_time'] as String,
  id: json['id'] as String,
  male: (json['male'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  female: (json['female'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  branch: json['branch'] as String,
  treatments: (json['treatments'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$PatientRegisterRequestToJson(
  PatientRegisterRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'excecutive': instance.excecutive,
  'payment': instance.payment,
  'phone': instance.phone,
  'address': instance.address,
  'total_amount': instance.total_amount,
  'discount_amount': instance.discount_amount,
  'advance_amount': instance.advance_amount,
  'balance_amount': instance.balance_amount,
  'date_nd_time': instance.date_nd_time,
  'id': instance.id,
  'male': instance.male,
  'female': instance.female,
  'branch': instance.branch,
  'treatments': instance.treatments,
};
