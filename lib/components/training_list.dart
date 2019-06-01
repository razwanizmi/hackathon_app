import 'package:flutter/material.dart';
import 'dart:math';
import 'training_details.dart';

class Training {
  String title;
  String desc;

  Training(this.title, this.desc);
}

class TrainingList extends StatefulWidget {
  @override
  TrainingListState createState() => TrainingListState();
}

class TrainingListState extends State<TrainingList> {
  final _titleFont = const TextStyle(fontSize: 18.0);
  final _stubTrainingList = List<Training>.generate(6, (i) {
    var number = i + 1;
    return Training('Flutter Training $number',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildTrainingList());
  }

  Widget _buildTrainingList() {
    var rng = new Random();
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i >= _stubTrainingList.length) {
            _stubTrainingList.addAll(List.generate(6, (j) {
              final newIndex = _stubTrainingList.length + j;
              return Training('Flutter Training $newIndex',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do');
            }));
          }
          return _buildRow(_stubTrainingList[i], rng.nextInt(500));
        });
  }

  Widget _buildRow(Training training, int randInt) {
    final imageUrl = 'https://picsum.photos/id/$randInt';
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TrainingDetails(training.title, '$imageUrl/500/300')));
        },
        child: Card(
            child: ListTile(
                leading: Container(
                  child: Image.network(
                    '$imageUrl//200/300',
                    fit: BoxFit.fill,
                    height: 50.0,
                    width: 75.0,
                  ),
                ),
                title: Text(training.title, style: _titleFont),
                subtitle: Text(training.desc),
                isThreeLine: true)));
  }
}
