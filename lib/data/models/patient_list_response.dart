class PatientResponse {
  bool? status;
  String? message;
  List<Patient>? patient;

  PatientResponse({this.status, this.message, this.patient});

  factory PatientResponse.fromJson(Map<String, dynamic> json) {
    return PatientResponse(
      status: json['status'],
      message: json['message'],
      patient: (json['patient'] as List<dynamic>?)
          ?.map((e) => Patient.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'patient': patient?.map((e) => e.toJson()).toList(),
    };
  }
}

class Patient {
  int? id;
  List<PatientDetails>? patientdetailsSet;
  dynamic branch;
  String? user;
  String? payment;
  String? name;
  String? phone;
  String? address;
  int? price;
  int? totalAmount;
  int? discountAmount;
  int? advanceAmount;
  int? balanceAmount;
  String? dateNdTime;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Patient({
    this.id,
    this.patientdetailsSet,
    this.branch,
    this.user,
    this.payment,
    this.name,
    this.phone,
    this.address,
    this.price,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      patientdetailsSet: (json['patientdetails_set'] as List<dynamic>?)
          ?.map((e) => PatientDetails.fromJson(e))
          .toList(),
      branch: json['branch'],
      user: json['user'],
      payment: json['payment'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      price: json['price'],
      totalAmount: json['total_amount'],
      discountAmount: json['discount_amount'],
      advanceAmount: json['advance_amount'],
      balanceAmount: json['balance_amount'],
      dateNdTime: json['date_nd_time'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientdetails_set': patientdetailsSet?.map((e) => e.toJson()).toList(),
      'branch': branch,
      'user': user,
      'payment': payment,
      'name': name,
      'phone': phone,
      'address': address,
      'price': price,
      'total_amount': totalAmount,
      'discount_amount': discountAmount,
      'advance_amount': advanceAmount,
      'balance_amount': balanceAmount,
      'date_nd_time': dateNdTime,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class PatientDetails {
  int? id;
  String? male;
  String? female;
  int? patient;
  int? treatment;
  String? treatmentName;

  PatientDetails({
    this.id,
    this.male,
    this.female,
    this.patient,
    this.treatment,
    this.treatmentName,
  });

  factory PatientDetails.fromJson(Map<String, dynamic> json) {
    return PatientDetails(
      id: json['id'],
      male: json['male'],
      female: json['female'],
      patient: json['patient'],
      treatment: json['treatment'],
      treatmentName: json['treatment_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'male': male,
      'female': female,
      'patient': patient,
      'treatment': treatment,
      'treatment_name': treatmentName,
    };
  }
}
