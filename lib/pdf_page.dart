import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PDFPage extends StatelessWidget {
  const PDFPage({super.key});
  final String url =
      'https://papers.gceguide.com/A%20Levels/Mathematics%20-%20Further%20(9231)/2003/9231_s03_qp_2.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Page"),
      ),
      body: StreamBuilder(
        stream: DefaultCacheManager().getFileStream(url),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PdfDocumentLoader.openFile(snapshot.data!.originalUrl);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
