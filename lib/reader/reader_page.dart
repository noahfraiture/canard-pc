import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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

  // TODO : problem is that a page change is consider at the right border of the screen
  Map<int, bool> bookmarks = {};
  late bool isBookmark;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    isBookmark = bookmarks[_pdfViewerController.pageNumber] ?? false;
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
                      }))),
          IconButton(
              icon: isBookmark ? const Icon(Icons.bookmark_added) : const Icon(Icons.bookmark_add),
              onPressed: () {
                setState(() {
                  bookmarks[_pdfViewerController.pageNumber] =
                      !(bookmarks[_pdfViewerController.pageNumber] ?? false);
                  isBookmark = bookmarks[_pdfViewerController.pageNumber]!;
                });
              }),
          IconButton(
              icon: const Icon(Icons.bookmarks), onPressed: () => _showBookmarksDialog(context))
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
            onPageChanged: (page) {
              setState(() => isBookmark = bookmarks[page.newPageNumber] ?? false);
            },
          ),
        ));
  }

  void _showBookmarksDialog(BuildContext context) {
    final bookmarkedPages = bookmarks.entries.where((entry) => entry.value).toList();

    if (bookmarkedPages.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('No bookmarks found.'),
          ),
        );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Go to Bookmark'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: bookmarkedPages.length,
            itemBuilder: (context, index) {
              final page = bookmarkedPages[index].key;
              return ListTile(
                title: Text('Page $page'),
                onTap: () {
                  _pdfViewerController.jumpToPage(page);
                  Navigator.pop(context);
                },
              );
            },
          ),
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: () => _changeScrollDirection(),
                    child: Row(children: [
                      Icon(widget.scrollDirection == PdfScrollDirection.horizontal
                          ? Icons.view_stream
                          : Icons.view_column),
                      const SizedBox(width: 8.0),
                      Text(widget.scrollDirection == PdfScrollDirection.horizontal
                          ? 'Horizontal'
                          : 'Vertical'),
                    ])),
                TextButton(
                  onPressed: () => _changePageLayoutMode(),
                  child: Row(
                    children: [
                      Icon(widget.pageLayoutMode == PdfPageLayoutMode.continuous
                          ? Icons.add_box
                          : Icons.add_box_outlined),
                      const SizedBox(width: 8.0),
                      Text(widget.pageLayoutMode == PdfPageLayoutMode.continuous
                          ? 'Continuous'
                          : 'Single')
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
