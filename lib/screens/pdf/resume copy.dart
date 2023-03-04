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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

Future<Uint8List> generateResume(PdfPageFormat format, var data) async {
  final doc = pw.Document(title: 'My Resume', author: 'David PHAM-VAN');

  // final profileImage = pw.MemoryImage(
  //   (await rootBundle.load('assets/images/Adddollar.jpg')).buffer.asUint8List(),
  // );

  final pageTheme = await _myPageTheme(format);

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
    width: 595,
    height: 200,
    color: PdfColor.fromInt((0xff090450),
)),
                  pw.Container(
                    width: 595,
                    height: 200,
                    color: PdfColor.fromInt(0xff090450),
                  ),
                  pw.Container(
                    width: 100,
                    height: 100,
                    child: pw.Stack(
                      children:[pw.Container(
                        width: 100,
                        height: 100,
                        decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColor.fromInt(0xffd9d9d9),
                        ),
                      ),
                        pw.Positioned.fill(
                          child: pw.Align(
                            alignment: pw.Alignment.topLeft,
                            child: pw.Container(
                              width: 118,
                              height: 118,
                              // child: FlutterLogo(size: 118),
                            ),
                          ),
                        ),],
                    ),
                  ),
                  pw.Container(
                    width: 100,
                    height: 100,
                    decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      border: pw.Border.all(color: PdfColor.fromInt(0xfff7f7f7), width: 3, ),
                    ),
                  ),
                  pw.Text(
                    "NAME",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xffffffff),
                      fontSize: 24,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  pw.Text(
                    "CONTACT INFO",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff090450),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  pw.Text(
                    "WORK EXPERIENCE",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff090450),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  pw.Text(
                    "EDUCATION",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff090450),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  pw.Text(
                    "SKILLS",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff090450),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  pw.Text(
                    "DESIGINATION",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xffffff),
                      fontSize: 14,
                    ),
                  ),
                  pw.SizedBox(
                    width: 412,
                    height: 63,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur. Sem quis sit eu sit dui. Consequat pulvinar amet neque at sed sit. Vitae in ac facilisis orci. Sit gravida vestibulum eu massa nunc ",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xffffff),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  pw.Text(
                    "2018 - 2023",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff090450),
                      fontSize: 10,
                    ),
                  ),
                  pw.Text(
                    "2018 - 2023",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff090450),
                      fontSize: 10,
                    ),
                  ),
                  pw.Text(
                    "PROJECTS",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff090450),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  pw.Text(
                    "2018 - 2023",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff090450),
                      fontSize: 10,
                    ),
                  ),
                  pw.SizedBox(
                    width: 151,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 367,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur amet amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 367,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur amet amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 367,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur amet amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 348,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur amet amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 348,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur amet amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 348,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur amet amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 348,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur amet amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.Text(
                    "Explore IT Solutions",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff333333),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w800,
                    ),
                  ),
                  pw.Text(
                    "Explore IT Solutions",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff333333),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w800,
                    ),
                  ),
                  pw.Text(
                    "Flutter Developer",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff777777),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w800,
                    ),
                  ),
                  pw.Text(
                    "Flutter Developer",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff777777),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w800,
                    ),
                  ),
                  pw.Text(
                    "Flutter Developer",
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xff777777),
                      fontSize: 16,
                      // fontFamily: "Open Sans",
                      // fontWeight: FontWeight.w800,
                    ),
                  ),
                  pw.SizedBox(
                    width: 151,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 151,
                    child: pw.Text(
                      "Lorem ipsum dolor sit amet consectetur",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 55,
                    height: 25,
                    child: pw.Text(
                      "Python\n",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 55,
                    height: 27,
                    child: pw.Text(
                      "\nReact\n",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 85,
                    height: 27,
                    child: pw.Text(
                      "Node js",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xff777777),
                        fontSize: 14,
                        // fontFamily: "Open Sans",
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 84,
                    height: 19,
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children:[
                        pw.Container(
                          width: 16,
                          height: 16,
                          // child: FlutterLogo(size: 16),
                        ),
                        pw.SizedBox(width: 9),
                        pw.Text(
                          "Location",
                          style: pw.TextStyle(
                            color: PdfColor.fromInt(0xff777777),
                            fontSize: 14,
                            // fontFamily: "Open Sans",
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Container(
                    width: 69,
                    height: 19,
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children:[
                        pw.Container(
                          width: 16,
                          height: 16,
                          // child: FlutterLogo(size: 16),
                        ),
                        pw.SizedBox(width: 9),
                        pw.Text(
                          "Phone",
                          style: pw.TextStyle(
                            color: PdfColor.fromInt(0xff777777),
                            fontSize: 14,
                            // fontFamily: "Open Sans",
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Container(
                    width: 63,
                    height: 19,
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children:[
                        pw.Container(
                          width: 16,
                          height: 16,
                          // child: FlutterLogo(size: 16),
                        ),
                        pw.SizedBox(width: 9),
                        pw.Text(
                          "Email",
                          style: pw.TextStyle(
                            color: PdfColor.fromInt(0xff777777),
                            fontSize: 14,
                            // fontFamily: "Open Sans",
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Container(
                    width: 79,
                    height: 19,
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children:[
                        pw.Container(
                          width: 16,
                          height: 16,
                          // child: FlutterLogo(size: 16),
                        ),
                        pw.SizedBox(width: 8),
                        pw.Text(
                          "Website",
                          style: pw.TextStyle(
                            color: PdfColor.fromInt(0xff777777),
                            fontSize: 14,
                            // fontFamily: "Open Sans",
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                  // pw.Container(
                  //   padding: const pw.EdgeInsets.only(left: 30, bottom: 20),
                  //   child: pw.Column(
                  //     crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //     children: <pw.Widget>[
                  //       pw.Text('Parnella Charlesbois',
                  //           textScaleFactor: 2,
                  //           style: pw.Theme.of(context)
                  //               .defaultTextStyle
                  //               .copyWith(fontWeight: pw.FontWeight.bold)),
                  //       pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),
                  //       pw.Text('Electrotyper',
                  //           textScaleFactor: 1.2,
                  //           style: pw.Theme.of(context)
                  //               .defaultTextStyle
                  //               .copyWith(
                  //               fontWeight: pw.FontWeight.bold,
                  //               color: green)),
                  //       pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                  //       pw.Row(
                  //         crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  //         children: <pw.Widget>[
                  //           pw.Column(
                  //             crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //             children: <pw.Widget>[
                  //               pw.Text('568 Port Washington Road'),
                  //               pw.Text('Nordegg, AB T0M 2H0'),
                  //               pw.Text('Canada, ON'),
                  //             ],
                  //           ),
                  //           pw.Column(
                  //             crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //             children: <pw.Widget>[
                  //               pw.Text('+1 403-721-6898'),
                  //               _UrlText('p.charlesbois@yahoo.com',
                  //                   'mailto:p.charlesbois@yahoo.com'),
                  //               _UrlText(
                  //                   'wholeprices.ca', 'https://wholeprices.ca'),
                  //             ],
                  //           ),
                  //           pw.Padding(padding: pw.EdgeInsets.zero)
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
              //     _Category(title: 'Work Experience'),
              //     _Block(
              //         title: 'Tour bus driver',
              //         icon: const pw.IconData(0xe530)),
              //     _Block(
              //         title: 'Logging equipment operator',
              //         icon: const pw.IconData(0xe30d)),
              //     _Block(title: 'Foot doctor', icon: const pw.IconData(0xe3f3)),
              //     _Block(
              //         title: 'Unicorn trainer',
              //         icon: const pw.IconData(0xf0cf)),
              //     _Block(
              //         title: 'Chief chatter', icon: const pw.IconData(0xe0ca)),
              //     pw.SizedBox(height: 20),
              //     _Category(title: 'Education'),
              //     _Block(title: 'Bachelor Of Commerce'),
              //     _Block(title: 'Bachelor Interior Design'),
              //   ],
              // ),
            // ),

                ]))])]));
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

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    this.icon,
  });

  final String title;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Lorem(length: 20),
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => green;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
