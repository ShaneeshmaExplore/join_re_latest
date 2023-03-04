/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/painting.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

Future<Uint8List> generateResume(PdfPageFormat format, var data) async {
  final doc = pw.Document(title: 'My Resume', author: 'David PHAM-VAN');
  final location_image = pw.MemoryImage(
    (await rootBundle.load('assets/images/Location.png')).buffer.asUint8List(),
  );

  final mail_image = pw.MemoryImage(
    (await rootBundle.load('assets/images/Mail.png')).buffer.asUint8List(),
  );

  final phone_image = pw.MemoryImage(
    (await rootBundle.load('assets/images/Phone.png')).buffer.asUint8List(),
  );
  final website_image = pw.MemoryImage(
    (await rootBundle.load('assets/images/Home.png')).buffer.asUint8List(),
  );

  // final netImage = await networkImage(data['profile_img']);
  final netImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/Home.png')).buffer.asUint8List(),
  );
  final pageTheme = await _myPageTheme(format);
  final selected_color;
  if (data['color'] == 'secondary')
    selected_color = PdfColor.fromInt(0xAAC501);
  else
    selected_color = PdfColor.fromInt(0xff090450);
  var fontFamilyOpenSansBold = await PdfGoogleFonts.openSansBold();
  var fontFamilyOpenSans = await PdfGoogleFonts.openSansMedium();

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          children: [
            pw.Partition(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      width: 595,
                      height: 200,
                      color: selected_color,
                      child: pw.Row(children: [
                        pw.Container(
                          padding: pw.EdgeInsets.all(10),
                          width: 100,
                          height: 100,
                          decoration: pw.BoxDecoration(
                            image: pw.DecorationImage(
                              image: netImage,
                            ),
                            shape: pw.BoxShape.circle,

                            border: pw.Border.all(
                              color: PdfColor.fromInt(0xfff7f7f7),
                              width: 3,
                            ),
                          ),
                        ),
                        pw.Container(
                            padding: pw.EdgeInsets.all(10),
                            width: 400,
                            height: 200,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    // "NAME",
                                    '${data['name']}',
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xffffffff),
                                      fontSize: 24,
                                      font: fontFamilyOpenSansBold,
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  pw.Text(
                                    '${data['occupation_position_held'] ?? ''}',
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xffffff),
                                      fontSize: 14,
                                      font: fontFamilyOpenSans,
                                    ),
                                  ),
                                  pw.Text(
                                    '${data['activities_responsibilities'] ?? ''}',
                                    // "Lorem ipsum dolor sit amet consectetur. Sem quis sit eu sit dui. Consequat pulvinar amet neque at sed sit. Vitae in ac facilisis orci. Sit gravida vestibulum eu massa nunc ",
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xffffff),
                                      fontSize: 14,
                                      font: fontFamilyOpenSans,
                                    ),
                                  ),
                                ]))
                      ])),
                  pw.SizedBox(height: 20),
                  pw.Row(

                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "CONTACT INFO",
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSansBold,
                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          pw.Row(children: [
                            pw.Container(
                              width: 12,
                              height: 10,
                              decoration: pw.BoxDecoration(
                                image: pw.DecorationImage(
                                  image: location_image,
                                ),
                              ),
                            ),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Text(
                              // "Location",
                              '${data['exp_address']}',
                              style: pw.TextStyle(
                                color: PdfColor.fromInt(0xff777777),
                                fontSize: 14,
                                font: fontFamilyOpenSans,
                                // fontFamily: "Open Sans",
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                          pw.Row(children: [
                            pw.Container(
                                width: 12,
                                height: 10,
                                decoration: pw.BoxDecoration(
                                  image: pw.DecorationImage(
                                    image: mail_image,
                                  ),
                                )),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Text(
                              // "Email",
                              '${data['email']}',
                              style: pw.TextStyle(
                                color: PdfColor.fromInt(0xff777777),
                                fontSize: 14,
                                font: fontFamilyOpenSans,

                                // fontFamily: "Open Sans",
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                          pw.Row(children: [
                            pw.Container(
                              width: 12,
                              height: 10,
                              decoration: pw.BoxDecoration(
                                image: pw.DecorationImage(
                                  image: phone_image,
                                ),
                              ),
                            ),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Text(
                              '${data['mobile']}',
                              style: pw.TextStyle(
                                color: PdfColor.fromInt(0xff777777),
                                fontSize: 14,
                                font: fontFamilyOpenSans,

                                // fontFamily: "Open Sans",
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                          pw.Row(children: [
                            pw.Container(
                              width: 12,
                              height: 10,
                              decoration: pw.BoxDecoration(
                                image: pw.DecorationImage(
                                  image: website_image,
                                ),
                              ),
                            ),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Text(
                              "Website",
                              style: pw.TextStyle(
                                color: PdfColor.fromInt(0xff777777),
                                fontSize: 14,
                                font: fontFamilyOpenSans,

                                // fontFamily: "Open Sans",
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                          pw.Text(
                            "EDUCATION",
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSansBold,

                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          pw.Text(
                            '${data['title_of_qualification']}',
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSans,

                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          pw.Text(
                            '${data['title_of_qualification']}',
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSans,

                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          pw.Text(
                            "SKILLS",
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSansBold,

                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          pw.Text(
                            '${data['activities_reponsibilities']}',
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSans,

                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]),
                    pw.SizedBox(width: 20),
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "WORK EXPERIENCE",
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSansBold,

                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          pw.Text(
                            '${data['occupation_position_held']}',
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSans,

                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          pw.Text(
                            '${data['occupation_position_held']}',
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xff090450),
                              fontSize: 16,
                              font: fontFamilyOpenSans,

                              // fontFamily: "Open Sans",
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ])
                  ]),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  // final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            // pw.Positioned(
            //   child: pw.SvgImage(svg: bgShape),
            //   left: 0,
            //   top: 0,
            // ),
            // pw.Positioned(
            //   child: pw.Transform.rotate(
            //       angle: pi, child: pw.SvgImage(svg: bgShape)),
            //   right: 0,
            //   bottom: 0,
            // ),
          ],
        ),
      );
    },
  );
}
