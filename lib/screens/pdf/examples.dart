

import 'dart:async';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import 'resume.dart';

const examples = <Example>[
  Example('RESUME', 'resume.dart', generateResume),
];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, void data);

class Example {
  const Example(this.name, this.file, this.builder, [this.needsData = false]);

  final String name;

  final String file;

  final LayoutCallbackWithData builder;

  final bool needsData;
}