class MeetupItem {
  String title;
  String description;
  String date;
  String imageUrl;
  String pageUrl;

  MeetupItem({
    this.title,
    this.description,
    this.date,
    this.imageUrl,
    this.pageUrl,
  });
}

List<MeetupItem> meetupData = [
  MeetupItem(
    title: 'Flutter KL',
    description:
        'Flutter KL is a group to gather flutter developers around Klang Valley, Malaysia. Join us to meet other Flutter Developers in this area. We can share experiences on using Flutter, Dart, Firebase and any related technologies.',
    date: '1 June 2019',
    imageUrl:
        'https://secure.meetupstatic.com/photos/event/a/3/d/5/600_481361941.jpeg',
    pageUrl: 'https://www.meetup.com/Flutter-KL',
  ),
  MeetupItem(
    title: 'Google I/O Extended 2019',
    description:
        'Extended events span the world, connecting the global developer community. See where events were hosted in 2019, get involved, and start planning for 2020!',
    date: '16 June 2019',
    imageUrl:
        'https://scontent-kut2-2.xx.fbcdn.net/v/t1.0-9/60096251_2183144995096109_5471556239366291456_n.jpg?_nc_cat=109&_nc_ht=scontent-kut2-2.xx&oh=3b4fd285d76a7aacb24e9bb56b94aa6e&oe=5D882A01',
    pageUrl: 'https://www.facebook.com/GDGKualaLumpur',
  ),
  MeetupItem(
    title: 'Dart KL',
    description:
        'Meetup for dart programming language in Kuala Lumpur. All level of experiences are welcome!',
    date: '21 June 2019',
    imageUrl: 'https://dart.dev/assets/shared/dart-logo-for-shares.png',
    pageUrl: 'https://dart.dev',
  ),
];
