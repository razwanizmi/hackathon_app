import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './meetups_data.dart';

class Meetups extends StatefulWidget {
  @override
  _MeetupsState createState() => _MeetupsState();
}

class _MeetupsState extends State<Meetups> {
  int _selected;

  _launchURL(urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_selected != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(
            meetupData[_selected].imageUrl,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            child: Text(
              meetupData[_selected].title,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          ),
          Padding(
            child: Text(meetupData[_selected].date),
            padding: EdgeInsets.all(10),
          ),
          Padding(
            child: Text(meetupData[_selected].description),
            padding: EdgeInsets.all(10),
          ),
          Container(
            child: FlatButton(
              color: Theme.of(context).accentColor,
              child: Text('Attend'),
              padding: EdgeInsets.all(15.0),
              onPressed: () {
                _launchURL(meetupData[_selected].pageUrl);
              },
            ),
            margin: EdgeInsets.only(top: 20.0),
          ),
          Container(
            child: FlatButton(
              color: Theme.of(context).primaryColorLight,
              child: Text('Back'),
              onPressed: () {
                setState(() {
                  _selected = null;
                });
              },
              padding: EdgeInsets.all(15.0),
            ),
            margin: EdgeInsets.only(top: 10.0),
          ),
        ],
      );
    }

    return ListView.builder(
      itemCount: meetupData.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Container(
              child: Image.network(
                meetupData[index].imageUrl,
                fit: BoxFit.contain,
                height: 75.0,
                width: 75.0,
              ),
            ),
            onTap: () {
              setState(() {
                _selected = index;
              });
            },
            subtitle: Text(meetupData[index].date),
            title: Text(meetupData[index].title),
          ),
        );
      },
    );
  }
}
