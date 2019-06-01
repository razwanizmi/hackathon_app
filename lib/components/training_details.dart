import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TrainingDetails extends StatelessWidget {
	final String title;
	final String banner;

	TrainingDetails(
		this.title,
		this.banner
	);


	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: ListView(
				children: [
					_buildBannerSection(),
					_buildCuratorSection(),
					_buildDescriptionSection(),
					Card(child: ListTile(title: Text('Reading Material'))),
					Card(child: ListTile(title: Text('Week 1'))),
					Card(child: ListTile(title: Text('Week 2'))),
					Card(child: ListTile(title: Text('Week 3')))
				]
			)
		);
	}

	Widget _buildBannerSection() {
		return FadeInImage.memoryNetwork(
			placeholder: kTransparentImage,
			image: banner, 
			fit: BoxFit.cover
		);
	}

	Widget _buildCuratorSection() {
		return ListTile(
			leading: CircleAvatar(
				backgroundImage: NetworkImage('https://i.pravatar.cc/300')
			),
			title: Text('Test user'),
			subtitle: Text('Position')
		);
	}

	Widget _buildDescriptionSection() {
		return Container(
			margin: const EdgeInsets.only(left: 20.0, right: 20.0),
			child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut')
		);
	}
}