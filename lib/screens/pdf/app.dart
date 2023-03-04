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
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:join_re/screens/pdf/examples.dart';
import 'package:join_re/utils/api.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:printing/src/callback.dart' as cb;


class PdfApp extends StatefulWidget {
  final id;
  final color;
  final template;

  const PdfApp({Key? key,this.id,this.color,this.template}) : super(key: key);

  @override
  PdfAppState createState() {
    return PdfAppState();
  }
}

class PdfAppState extends State<PdfApp> with SingleTickerProviderStateMixin {
  int _tab = 0;
  TabController? _tabController;

  // PrintingInfo? printingInfo;

  var _hasData = false;
  var _pending = false;
  var arrData;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future view_profile() async {
    var data = {
      "id": widget.id,
    };
    var res = await Network().authData(data, '/view_profile');
    var convertedData;
    if(res.statusCode == 200){
      convertedData =json.decode(res.body);
      convertedData['job_seeker']['color'] = widget.color;
      convertedData['job_seeker']['template'] = widget.template;
      convertedData =convertedData['job_seeker'];
    }
    else{
      convertedData = 0;
    }

    return convertedData;

  }
  Future<void> _init() async {
    // final info = await Printing.info();
    var item = await view_profile();
    if(item != null){
      setState((){
        arrData = item;
      });
    }
    _tabController = TabController(
      vsync: this,
      length: examples.length,
      initialIndex: _tab,
    );
    _tabController!.addListener(() {
      if (_tab != _tabController!.index) {
        setState(() {
          _tab = _tabController!.index;
        });
      }
    });

    setState(() {
      // printingInfo = info;
    });
  }

  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  Future<void> _saveAsFile(
    BuildContext context,
      cb.LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    // final appDocDir = await getApplicationDocumentsDirectory();
    // final appDocPath = appDocDir.path;
    final appDocPath = "test";
    final file = File('$appDocPath/document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

    if (_tabController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Your CV'),
        bottom: TabBar(
          controller: _tabController,
          tabs: examples.map<Tab>((e) => Tab(text: e.name)).toList(),
          isScrollable: true,
        ),
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => examples[0].builder(format, arrData),
        actions: actions,
        onPrinted: _showPrintedToast,
        onShared: _showSharedToast,
      ),
    );
  }


}