import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../videos_list.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  List<VideoList> initialVideos = []
    ..add(
        VideoList('Google I/O 2019', 'https://www.youtube.com/watch?v=IyFZznAk69U&t=1142s', 'Beyond Mobile: Building Flutter Apps for iOS, Android, Chrome OS, and Web (Google I/O 2019)'))
    ..add(
        VideoList('Spacer: Flutter Wisget of the Week', 'https://www.youtube.com/watch?v=7FJgd7QN1zI', 'The Spacer widget can help you control how much space appears between widgets in a Row or Column. Just add it between two widgets and set its flex property to customize.'))
    ..add(
        VideoList('Announcing Flutter 1.0', 'https://www.youtube.com/watch?v=kpcjBD1XDwU', 'Thanks for tuning into Flutter Live! In this opening talk, Tim Sneath from the Flutter team explains the goals behind Flutter, how it was developed, and what it\'s capable of today. He also defines the four pillars of Flutter (beautiful, fast, productive, open) and how they are upheld by the SDK.'))
    ..add(
        VideoList('MWC 2019 Highlights', 'https://www.youtube.com/watch?v=9iUMZA46_8k', 'The Flutter team headed to Barcelona for Mobile World Congress 2019. At MWC, we released Flutter 1.2 and Dart 2.2. In this recap, you will learn about the highlights from Flutter’s MWC sessions on business, development, and design.'));
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
        return Card(
            child: GestureDetector(
                onTap: () async {
                  if (await canLaunch(initialVideos[int].url)) {
                    await launch(initialVideos[int].url);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(initialVideos[int].title,
                            style: TextStyle(fontSize: 24.0)),
                            Text(initialVideos[int].desc)
                  ],
                )));
      },
    );
  }
}
