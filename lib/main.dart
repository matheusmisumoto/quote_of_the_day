import 'package:flutter/material.dart';

void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quote of The Day',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new QuoteOfTheDay(),
    );
  }
}

class QuoteOfTheDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Quote of the day"),
        centerTitle: true,
      ),
      body: new Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 1),
            Text(
              "\"Some people see innovation as change, but we have never really seen it like that. It’s making things better.\"",
              style: new TextStyle(fontSize: 22.0, height: 1.5),
            ),
            SizedBox(height: 25),
            Text(
              "Tim Cook",
              textAlign: TextAlign.right,
              style: new TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold, height: 2),
            ),
            Text(
              "Apple CEO",
              textAlign: TextAlign.right,
              style: new TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            ),
            Spacer(flex: 1),
            RaisedButton(
              key: null,
              onPressed: () {},
              child: Text("Generate new quote"),
            ),
          ],
        ),
      ),
    );
  }
}
