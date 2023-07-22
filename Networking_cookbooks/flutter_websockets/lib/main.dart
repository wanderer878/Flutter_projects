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
            height: 20,
            width: 20,
            child: StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) ;
                  msg_list.add(snapshot.data.toString());

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: msg_list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(msg_list[index]);
                      });
                }),
          ),
          FloatingActionButton(
            onPressed: () {
              send_msg();
            },
            tooltip: 'send message',
            child: const Icon(Icons.send),
          )
        ],
      )),
    );
  }

  void send_msg() {
    if (_controller.text.isNotEmpty) _channel.sink.add(_controller.text);
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
