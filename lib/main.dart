import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'quotes.dart';
import 'dart:io' show Platform;

void main() {
  if (Platform.isAndroid) {
    runApp(AndroidApp());
  } else if (Platform.isIOS) {
    runApp(AppleApp());
  }
}

class AppleApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: AppleScreen(),
    );
  }
}

class AppleScreen extends StatefulWidget {
  AppleScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AppleScreen createState() => _AppleScreen();
}

class _AppleScreen extends State<AppleScreen> {
  dynamic theQuote = QuotesDB().giveMeQuote();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Quote of the Day'),
            )
          ];
        },
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(flex: 1),
                Text(
                  "\"${theQuote['quote']}\"",
                  style: new TextStyle(fontSize: 22.0, height: 1.5),
                ),
                SizedBox(height: 25),
                Text(
                  theQuote['author'],
                  textAlign: TextAlign.right,
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold, height: 2),
                ),
                Text(
                  theQuote['description'],
                  textAlign: TextAlign.right,
                  style: new TextStyle(
                      fontSize: 18.0, fontStyle: FontStyle.italic),
                ),
                Spacer(flex: 1),
                CupertinoButton.filled(
                  key: null,
                  onPressed: () {
                    setState(() {
                      theQuote = QuotesDB().giveMeQuote();
                    });
                  },
                  child: Text("Generate new quote"),
                ),
                CupertinoButton(
                  key: null,
                  onPressed: () {},
                  child: Text("About this app"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AndroidApp extends StatelessWidget {
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

class QuoteOfTheDay extends StatefulWidget {
  QuoteOfTheDay({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _QuoteOfTheDayState createState() => _QuoteOfTheDayState();
}

class _QuoteOfTheDayState extends State<QuoteOfTheDay> {
  dynamic theQuote = QuotesDB().giveMeQuote();

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
              "\"${theQuote['quote']}\"",
              style: new TextStyle(fontSize: 22.0, height: 1.5),
            ),
            SizedBox(height: 25),
            Text(
              theQuote['author'],
              textAlign: TextAlign.right,
              style: new TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold, height: 2),
            ),
            Text(
              theQuote['description'],
              textAlign: TextAlign.right,
              style: new TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            ),
            Spacer(flex: 1),
            RaisedButton(
              key: null,
              onPressed: () {
                setState(() {
                  theQuote = QuotesDB().giveMeQuote();
                });
              },
              child: Text("Generate new quote"),
            ),
          ],
        ),
      ),
    );
  }
}
