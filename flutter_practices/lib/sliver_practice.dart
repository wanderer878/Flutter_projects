import 'package:flutter/material.dart';

class Sliver_List_Appbar extends StatelessWidget {
  Sliver_List_Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.blurBackground,
                StretchMode.fadeTitle
              ],
              background: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.blue[600]!, Colors.transparent]),
                ),
                position: DecorationPosition.foreground,
                child: Image.asset(
                  'assets/florian-olivo-Mf23RF8xArY-unsplash.jpg',
                  /*Image.network(
                  'https://images.unsplash.com/photo-1717400411765-0d6a4d0bc8db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDB8fHxlbnwwfHx8fHw%3D',*/
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Games',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[600],
            expandedHeight: 150,
          ),
          Sliver_list()
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String Image_link;
  final String title;
  final String subtitle;
  const Card(
      {super.key,
      required this.Image_link,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Colors.lightBlue.shade100!, Colors.transparent]),
          image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.2,
              image: NetworkImage(Image_link))),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              Image_link,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white70),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Sliver_list extends StatelessWidget {
  Sliver_list({super.key});

  final List<Data> data_list = [
    Data('Fallout', 'bethesda',
        "https://images.ctfassets.net/rporu91m20dc/7HLZ1zRm8g8kCgki0aa8Oq/511ab54d985e6309b6ee8d89190f1f7a/Fallout76_LargeHero_OfficialReveal.jpg?q=70&&&fm=webp"),
    Data('borderlands 2', '4k games',
        'https://upload.wikimedia.org/wikipedia/en/thumb/5/51/Borderlands_2_cover_art.png/220px-Borderlands_2_cover_art.png'),
    Data('Gta 4', 'Rockstar games',
        "https://upload.wikimedia.org/wikipedia/en/thumb/b/b7/Grand_Theft_Auto_IV_cover.jpg/220px-Grand_Theft_Auto_IV_cover.jpg"),
    Data('half life', 'valve',
        "https://cdn.mos.cms.futurecdn.net/TDCYXoYuAmCkMx2v3A22AG-650-80.jpeg.webp"),
    Data('counter strike', 'valve',
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/CS2_Cover_Art.jpg/220px-CS2_Cover_Art.jpg"),
    Data('tomb raider', '4k games',
        "https://upload.wikimedia.org/wikipedia/en/thumb/1/11/Shadow_of_the_Tomb_Raider_cover.png/220px-Shadow_of_the_Tomb_Raider_cover.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: data_list.length,
            (_, int index) {
      return Card(
          Image_link: data_list[index].ImageSource,
          title: data_list[index].title,
          subtitle: data_list[index]
              .subtitle); /*ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            data_list[index].ImageSource,
          ),
        ),
        title: Text(data_list[index].title),
        subtitle: Text(data_list[index].subtitle),
      );*/
    }));
  }
}

class Data {
  final String title;
  final String subtitle;
  final String ImageSource;

  Data(this.title, this.subtitle, this.ImageSource);
}
