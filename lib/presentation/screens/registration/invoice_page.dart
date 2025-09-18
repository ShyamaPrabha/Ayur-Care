import 'package:ayur_care/presentation/screens/registration/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class InvoicePage extends StatelessWidget {
  final String patientName;
  final String adress;
  final String phoneNo;
  final String bookedOn;
  final String treatmentDate;
  final String treatmentTime;
  final String totalAmount;
  final String discountAmount;
  final String balanceAmount;
  final String advanceAmount;
  const InvoicePage({
    super.key,
    required this.adress,
    required this.balanceAmount,
    required this.bookedOn,
    required this.discountAmount,
    required this.patientName,
    required this.phoneNo,
    required this.totalAmount,
    required this.treatmentDate,
    required this.treatmentTime,
    required this.advanceAmount
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invoice PDF")),
      body: PdfPreview(build: (format) => generateInvoicePdf(
        adress: adress,
        advanceAmount: advanceAmount,
        balanceAmount: balanceAmount,
        bookedOn: bookedOn,
        discountAmount: discountAmount,
        patientName: patientName,
        phoneNo: phoneNo,
        totalAmount: totalAmount,
        treatmentDate: treatmentDate,
        treatmentTime: treatmentTime
      )),
    );
  }
}
