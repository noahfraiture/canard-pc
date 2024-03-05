import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReaderPage extends StatefulWidget {
  final List<String> imagePaths; // List of image paths or PDF file paths

  const ReaderPage({super.key, required this.imagePaths});

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: SfPdfViewer.asset("assets/special-1.pdf")),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
