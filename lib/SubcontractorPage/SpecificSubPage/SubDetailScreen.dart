import 'package:flutter/material.dart';
import 'package:punchlist/SubcontractorPage/contractors.dart';

class SubDetailScreen extends StatelessWidget {

  final Contractors sub;

  SubDetailScreen({Key key, @required this.sub}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sub.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Phone Number:'),
            Text(sub.phone),
            Text('Email:'),
            Text(sub.email),
          ],
        ),
      ),
    );
  }
}
