import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

enum ScrollDirection { horizontal, vertical }

class ReaderPage extends StatefulWidget {
  final String pdfPath;

  const ReaderPage({super.key, required this.pdfPath});

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  PdfScrollDirection _scrollDirection = PdfScrollDirection.horizontal;
  PdfPageLayoutMode _pageLayoutMode = PdfPageLayoutMode.continuous;
  late final PdfViewerController _pdfViewerController;

  Set<int> bookmarks = {};

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Reader'), actions: [
        IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => OptionPanel(
                    scrollDirection: _scrollDirection,
                    pageLayoutMode: _pageLayoutMode,
                    notifyParent: (pdfScrollDirection, pdfPageLayoutMode) {
                      setState(() {
                        _scrollDirection = pdfScrollDirection;
                        _pageLayoutMode = pdfPageLayoutMode;
                      });
                    },
                  ),
                )),
        IconButton(
            icon: const Icon(Icons.bookmark_add),
            onPressed: () => bookmarks.add(_pdfViewerController.pageNumber)),
        IconButton(icon: const Icon(Icons.bookmarks), onPressed: () => log(bookmarks.toString()))
      ]),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SfPdfViewer.asset(
          widget.pdfPath,
          controller: _pdfViewerController,
          scrollDirection: _scrollDirection,
          canShowScrollHead: false,
          canShowScrollStatus: true,
          pageLayoutMode: _pageLayoutMode,
          // TODO : display different bookmark icon depending on whether the page is bookmarked
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class OptionPanel extends StatefulWidget {
  OptionPanel(
      {super.key,
      required this.scrollDirection,
      required this.pageLayoutMode,
      required this.notifyParent});
  PdfScrollDirection scrollDirection;
  PdfPageLayoutMode pageLayoutMode;
  void Function(PdfScrollDirection, PdfPageLayoutMode) notifyParent;

  @override
  State<OptionPanel> createState() => _OptionPanelState();
}

class _OptionPanelState extends State<OptionPanel> {
  void _changeScrollDirection() {
    setState(() {
      widget.scrollDirection = widget.scrollDirection == PdfScrollDirection.horizontal
          ? PdfScrollDirection.vertical
          : PdfScrollDirection.horizontal;
    });
    widget.notifyParent(widget.scrollDirection, widget.pageLayoutMode);
  }

  void _changePageLayoutMode() {
    setState(() {
      widget.pageLayoutMode = widget.pageLayoutMode == PdfPageLayoutMode.continuous
          ? PdfPageLayoutMode.single
          : PdfPageLayoutMode.continuous;
    });
    widget.notifyParent(widget.scrollDirection, widget.pageLayoutMode);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(widget.scrollDirection == PdfScrollDirection.horizontal
                      ? Icons.view_stream
                      : Icons.view_column),
                  onPressed: () => _changeScrollDirection()),
              const SizedBox(width: 8.0),
              Text(widget.scrollDirection == PdfScrollDirection.horizontal
                  ? 'Horizontal'
                  : 'Vertical'),
              IconButton(
                  icon: Icon(widget.pageLayoutMode == PdfPageLayoutMode.continuous
                      ? Icons.add_box
                      : Icons.add_box_outlined),
                  onPressed: () => _changePageLayoutMode()),
              const SizedBox(width: 8.0),
              Text(widget.pageLayoutMode == PdfPageLayoutMode.continuous ? 'Continuous' : 'Single')
            ],
          ),
        ],
      ),
    );
  }
}
