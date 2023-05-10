// ignore_for_file: must_be_immutable, file_names


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:zoom_widget/zoom_widget.dart';

class WebFileView extends StatefulWidget {
  List<int> data;
  WebFileView({Key? key, required this.data}) : super(key: key);

  @override
  State<WebFileView> createState() => _WebFileViewState();
}

class _WebFileViewState extends State<WebFileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Zoom(
        centerOnScale: true,
        enableScroll: true,
        doubleTapZoom: true,
        zoomSensibility: 2.3,
        canvasColor: Colors.black,
        backgroundColor: Colors.transparent,
        initZoom: 0.0,
        maxZoomWidth: 1000,
        maxZoomHeight: 1550,
        child: Image.memory(
          widget.data as Uint8List,
        ),
        // CachedNetworkImage(imageUrl: widget.data),
        //  Html(
        //   data: widget.data,
        // ),
      ),
    );
  }
}
