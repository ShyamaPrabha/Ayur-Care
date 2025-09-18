import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generateInvoicePdf({
  required String   patientName,
  required String adress,
  required String phoneNo,
  required String bookedOn,
  required String treatmentDate,
  required String treatmentTime,
  required String totalAmount,
  required String discountAmount,
  required String balanceAmount,
  required String advanceAmount
}) async {
  final pdf = pw.Document();
  final font = pw.Font.ttf(await rootBundle.load('assets/fonts/Poppins300.ttf'));
  final imageBytes = await rootBundle.loadString(
    'assets/images/ayurcare_logo.svg',
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header with Logo + Clinic Info
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.SvgImage(svg: imageBytes, width: 100, height: 100),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      "KUMARAKOM",
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),

                    pw.Text("Cheepunkal PO, Kumarakom, Kerala - 686563",style: pw.TextStyle(font: font),),
                    pw.Text("e-mail: unknown@gmail.com",style: pw.TextStyle(font: font),),
                    pw.Text("Mob: +91 9876543210 | +91 9876543210",style: pw.TextStyle(font: font),),
                    pw.Text("GST No: 32AACBL0008B3IZW",
                      style: pw.TextStyle(font: font),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Divider(),
            // Patient Details
            pw.Text(
              "Patient Details",
              style: pw.TextStyle(
                font: font,
                fontSize: 13,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex("#00A64F"),
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Name: $patientName",style: pw.TextStyle(font: font),),
                    pw.Text("Address: $adress",
                      style: pw.TextStyle(font: font),
                    ),
                    pw.Text("WhatsApp: $phoneNo",
                      style: pw.TextStyle(font: font),
                    ),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Text("Booked On: $bookedOn",
                      style: pw.TextStyle(font: font),
                    ),
                    pw.Text("Treatment Date: $treatmentDate",
                      style: pw.TextStyle(font: font),
                    ),
                    pw.Text("Treatment Time: $treatmentTime",
                      style: pw.TextStyle(font: font),
                    ),
                  ],
                ),
              ],
            ),

            pw.SizedBox(height: 15),
            _buildDivider(),
            // Table of Treatments
            pw.Table(

              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(2),
                2: const pw.FlexColumnWidth(1),
                3: const pw.FlexColumnWidth(1),
                4: const pw.FlexColumnWidth(2),
              },
              children: [
                pw.TableRow(
              
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                        "Treatment",
                        style: pw.TextStyle(
                          font: font,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromHex("#00A64F"),
                        ),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                        "Price",
                        style: pw.TextStyle(
                          font: font,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromHex("#00A64F"),
                        ),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                        "Male",
                        style: pw.TextStyle(
                          font: font,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromHex("#00A64F"),
                        ),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                        "Female",
                        style: pw.TextStyle(
                          font: font,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromHex("#00A64F"),
                        ),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                        "Total",
                        style: pw.TextStyle(
                          font: font,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromHex("#00A64F"),
                        ),
                      ),
                    ),
                  ],
                ),
                _buildRow("Panchakarma", "₹230", "4", "4", "₹2540", font),
                _buildRow("Njavara Kizhi Treatment", "₹230", "4", "4", "₹2540", font),
                _buildRow("Panchakarma", "₹230", "6", "2", "₹2540", font),
              ],
            ),
            pw.SizedBox(height: 20),
            _buildDivider(),
            // Summary
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  _buildSummaryRow("Total Amount",font, "₹$totalAmount"),
                  _buildSummaryRow("Discount",font, "₹$discountAmount"),
                  _buildSummaryRow("Advance",font, "₹$advanceAmount"),
                  _buildDivider(),
                  _buildSummaryRow("Balance", font, "₹$balanceAmount", bold: true),
           
                  pw.Text(
                    "Thank you for choosing us",
                    style: pw.TextStyle(
                      font:   font,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex("#00A64F"),
                    ),
                  ),
             
                  pw.Text(
                    "Your well-being is our commitment, and we’re honoured \nto assist you on your health journey",
                    textAlign: pw.TextAlign.right,
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 10,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColor.fromHex("#00000036"),
                    ),
                  ),
                  //  ),
                ],
              ),
            ),
            pw.SizedBox(height: 20),

            // Footer
            //   pw.Divider(),
          ],
        );
      },
    ),
  );

  return pdf.save();
}

pw.Row _buildDivider() {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: List.generate(
      30, // number of dashes
      (index) => pw.Container(width: 6, height: 2, color: PdfColors.grey),
    ),
  );
}

// Helper to build a table row
pw.TableRow _buildRow(
  String treatment,
  String price,
  String male,
  String female,
  String total,
  pw.Font font
) {
  return pw.TableRow(
    children: [
      pw.Padding(
        padding: const pw.EdgeInsets.all(5),
        child: pw.Text(treatment, style: pw.TextStyle(font: font)),
      ),
      pw.Padding(padding: const pw.EdgeInsets.all(5), child: pw.Text(price,style: pw.TextStyle(font: font),)),
      pw.Padding(padding: const pw.EdgeInsets.all(5), child: pw.Text(male, style: pw.TextStyle(font: font))),
      pw.Padding(padding: const pw.EdgeInsets.all(5), child: pw.Text(female, style: pw.TextStyle(font: font))),
      pw.Padding(padding: const pw.EdgeInsets.all(5), child: pw.Text(total, style: pw.TextStyle(font: font))),
    ],
  );
}

// Helper for summary section
pw.Widget _buildSummaryRow(
  String label,
    pw.Font font,
  String value, {
  bool bold = false,
  PdfColor color = PdfColors.black,

}) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 2),
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            font: font,
            fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
        pw.Text(
          value,
          style: pw.TextStyle(
            font: font,
            fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
            color: color,
          ),
        ),
      ],
    ),
  );
}
