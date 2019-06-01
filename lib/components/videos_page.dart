import 'package:flutter/material.dart';

import '../videos_list.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  List<VideoList> initialVideos = []
    ..add(
        VideoList('Training 1', 'https://www.youtube.com', 'Training video 1'))
    ..add(
        VideoList('Training 2', 'https://www.youtube.com', 'Training video 2'))
    ..add(
        VideoList('Training 3', 'https://www.youtube.com', 'Training video 3'))
    ..add(
        VideoList('Training 4', 'https://www.youtube.com', 'Training video 4'));
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
    // return Container(child: Center(child: VideoList(initialVideos)));
  }

  ListView _buildList(context) {
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: initialVideos.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        return Text(initialVideos.toString());
      },
    );
  }
}
