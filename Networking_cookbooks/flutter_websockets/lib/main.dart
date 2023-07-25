import 'dart:math';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> msg_list = [];

  final TextEditingController _controller = TextEditingController();
  final _channel =
      WebSocketChannel.connect(Uri.parse("wss://echo.websocket.events"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your message',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder(
                    stream: _channel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) ;
                      msg_list.add(snapshot.data.toString());
                      print(msg_list);

                      return ListView.builder(
                          itemCount: msg_list.length,
                          itemBuilder: (context, index) {
                            return Text(msg_list[index]);
                          });
                    }),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: () {
          send_msg();
        },
        label: Text('send message'),
        icon: Icon(Icons.send),
      ),
    );
  }

  void send_msg() {
    if (_controller.text.isNotEmpty) _channel.sink.add(_controller.text);
    _controller.text = '';
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    msg_list = [];
    super.dispose();
  }
}
