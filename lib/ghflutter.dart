

import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ghflutter/FollowerDetailsPage.dart';

import 'member.dart';
import 'strings.dart';

class GHFlutterState extends State<GHFlutter> {
  var _members = <Member>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text(Strings.appTitle),
      ),
      body: new ListView.builder(
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return new Divider();

            final index = position ~/ 2;

            return _buildRow(index);
          }),
    );
  }

  Widget _buildRow(int i) {
    return new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new ListTile(
          title: new Text("${_members[i].login}", style: _biggerFont),
          leading: new CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: new NetworkImage(_members[i].avatarUrl)
          ),
        )
    );
  }

  _loadData() async {
    String dataURL = "https://api.github.com/users/ng-model/followers";
    var response = await http.get(dataURL);
    setState(() {
      final membersJSON = convert.jsonDecode(response.body);

      for (var memberJSON in membersJSON) {
        final member = new Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
         onPressed: (member) {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new FollowerDetailsPage(
                      // title: 'Follower Details',
                      // counter: widget.counter,
                    ),
                  ),
                );
              };
        
      }
    });
  }
}

class GHFlutter extends StatefulWidget {
  @override
  createState() => new GHFlutterState();
}