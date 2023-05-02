// ignore_for_file: must_be_immutable, file_names

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:zoom_widget/zoom_widget.dart';

class ImageView extends StatefulWidget {
  String data;
  ImageView({Key? key, required this.data}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
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
        child: widget.data.toString().substring(0, 5) == "https"
            ? Image.network(widget.data)
            : Image.file(
                File(widget.data),
              ),
        // CachedNetworkImage(imageUrl: widget.data),
        //  Html(
        //   data: widget.data,
        // ),
      ),
    );
  }
}
