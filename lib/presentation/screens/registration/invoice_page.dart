import 'package:ayur_care/presentation/screens/registration/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invoice PDF")),
      body: PdfPreview(build: (format) => generateInvoicePdf()),
    );
  }
}
