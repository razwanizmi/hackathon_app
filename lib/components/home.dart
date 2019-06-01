import 'package:flutter/material.dart';
import 'training_list.dart';
import './videos_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = <Widget>[
    Placeholder(color: Colors.deepPurple),
    Videos(),
    TrainingList(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Community'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.group),
            title: new Text('Meetups'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.videocam),
            title: new Text('Videos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Training'),
          )
        ],
        onTap: onTabTapped,
      ),
    );
  }
}

// TODO: Remove placeholder with actual components.
class Placeholder extends StatelessWidget {
  final Color color;

  Placeholder({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
