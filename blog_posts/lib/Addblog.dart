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
  @override
  Widget build(BuildContext context) {
    TextEditingController _titlecontroller = TextEditingController();
    TextEditingController _contentcontroller = TextEditingController();
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
                
                onPressed: _titlecontroller.text.isEmpty || _titlecontroller.text.isEmpty ?  null: () {
                 
                  Provider.of<Blog_provider>(context,listen: false).addblog(_titlecontroller.text, _contentcontroller.text);
                },
                child: Text('Add Blog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
