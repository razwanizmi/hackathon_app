import 'package:flutter/material.dart';
import 'dart:math';

class Training {
	String title;
	String desc;

	Training(
		this.title,
		this.desc
	);
}

class TrainingList extends StatefulWidget {
	@override
	TrainingListState createState() => TrainingListState();
}

class TrainingListState extends State<TrainingList> {
	final _titleFont = const TextStyle(fontSize: 18.0);
	final _stubTrainingList = List.generate(10, (i) {
		return Training(
			'Flutter Training $i', 
			'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do'
		);
	});
		
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: _buildTrainingList()
		);
	}

	Widget _buildTrainingList() {
		var rng = new Random();
		return ListView.builder(
			padding: const EdgeInsets.all(16.0),
			itemBuilder: (context, i) {
				if (i >= _stubTrainingList.length) {
					_stubTrainingList.addAll(List.generate(10, (j) {
						final newIndex = _stubTrainingList.length + j;
						return Training(
							'Flutter Training $newIndex',
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do'
						);
					}));
				}
				return _buildRow(_stubTrainingList[i], rng.nextInt(500));
			}
		);
	}

	Widget _buildRow(Training training, int randInt) {
		return Card(
			child: ListTile(
				leading: Image.network('https://picsum.photos/id/$randInt/200/300'),
				title: Text(training.title, style: _titleFont),
				subtitle: Text(training.desc),
				isThreeLine: true
			)
		);
	}
}