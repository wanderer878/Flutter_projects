import 'package:blog_posts/Blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Addbloag extends StatefulWidget {
  const Addbloag({super.key});

  @override
  State<Addbloag> createState() => _AddbloagState();
}

class _AddbloagState extends State<Addbloag> {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _contentcontroller = TextEditingController();
  bool _enabled = false;
  @override
  void initState() {
    super.initState();
    _titlecontroller.addListener(checktextfield);

    _contentcontroller.addListener(checktextfield);
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
        title: Text('Add Blog'),
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
                child: Text('Add blog'),
                onPressed: _enabled
                    ? () {
                        Provider.of<Blog_provider>(context, listen: false)
                            .addblog(
                                _titlecontroller.text, _contentcontroller.text);
                        Navigator.pop(context);
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
