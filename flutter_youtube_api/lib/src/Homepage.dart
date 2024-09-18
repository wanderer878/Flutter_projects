import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/src/AuthProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<Authprovider>(
                  builder: (context, Authprovider, child) {
                return Authprovider.playlist.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: Authprovider.playlist.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Authprovider.getplaylistItems(
                                  playlistId: Authprovider.playlist[index].id!);
                              Authprovider.DetailsData = {
                                'playlistId': Authprovider.playlist[index].id,
                                'playlistTitle':
                                    Authprovider.playlist[index].snippet!.title
                              };
                              if (MediaQuery.of(context).size.width < 600) {
                                context.go('/details');
                              }
                            },
                            child: ListTile(
                              title: Text(
                                  Authprovider.playlist[index].snippet!.title!),
                            ),
                          );
                        },
                      );
              }),
            ),
          ],
        )));
  }
}
