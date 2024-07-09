import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/ProviderClass.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  
  final int index;

  const DetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Provider.of<Providerclass>(context).games[index]),
      ),
    );
  }
}
