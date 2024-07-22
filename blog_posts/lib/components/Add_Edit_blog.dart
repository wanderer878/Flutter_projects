import 'package:blog_posts/Blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Add_Edit_blog extends StatefulWidget {
  const Add_Edit_blog({super.key, required this.barTitle, this.title,  this.content, required this.buttonText, required this.callback});
  final String barTitle, buttonText;
  final String? title,content;
  final Function callback;

  @override
  State<Add_Edit_blog> createState() => _AddbloagState();
}

class _AddbloagState extends State<Add_Edit_blog> {
  late TextEditingController _titlecontroller;
  late TextEditingController _contentcontroller;
  bool _enabled =  false;
  @override
  void initState() {
    super.initState();
    _titlecontroller = TextEditingController(text: widget.title)..addListener(checktextfield);

    _contentcontroller= TextEditingController(text: widget.content)..addListener(checktextfield);
  }
  @override
  void dispose() {
    super.dispose();
    _titlecontroller.dispose();
    _contentcontroller.dispose();
  }

  void checktextfield() {
    setState(() {
      _enabled =
          _titlecontroller.text.isEmpty || _contentcontroller.text.isEmpty
              ? false
              : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.barTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titlecontroller,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _contentcontroller,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Content',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: Text(widget.buttonText),
                onPressed: _enabled
                    ? () {
                        widget.callback(_titlecontroller.text,_contentcontroller.text);
                      }
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
