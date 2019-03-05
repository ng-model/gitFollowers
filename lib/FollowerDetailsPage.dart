import 'package:flutter/material.dart';

class FollowerDetailsPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Details'),
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
    
      );
    }
}