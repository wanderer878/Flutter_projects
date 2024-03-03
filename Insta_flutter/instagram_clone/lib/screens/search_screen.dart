import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class SearchSc extends StatefulWidget {
  const SearchSc({super.key});

  @override
  State<SearchSc> createState() => _SearchScState();
}

class _SearchScState extends State<SearchSc> {
  bool searched = false;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          decoration: InputDecoration(label: Text('Enter text  to search')),
          controller: _controller,
          onFieldSubmitted: (String value) {
            print(_controller.text);
          },
        ),
      ),
    );
  }
}
