// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

////////////////////////
// Search Bar At App Bar
///////////////////////


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isSearching = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching ? 
        Text(widget.title)
        : TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white), 
            hintText: "What are you looking for?",
            hintStyle: TextStyle(color: Colors.white)
          )
        ),
        actions: <Widget>[
          !isSearching ?
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState((){
                this.isSearching = false;
              });
            }
          )
          : IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState((){
                this.isSearching = true;
              });
            }
          )
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
