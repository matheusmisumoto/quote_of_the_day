import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
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
  @override
  _AppleScreen createState() => _AppleScreen();
}

class _AppleScreen extends State<AppleScreen> {
  dynamic theQuote = QuotesDB().giveMeQuote();

  Future<void> _about() async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('About'),
          message: Text(
              'Experimental app developed by Matheus Misumoto, web developer and journalist based in Santos, Brazil.'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Visit my website'),
              onPressed: () async {
                const url = 'https://matheusmisumoto.jor.br';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

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
                CupertinoButton(
                  key: null,
                  onPressed: () {
                    _about();
                  },
                  child: Text("About this app"),
                ),
                CupertinoButton.filled(
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
            TextButton(
              key: null,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AlertDialog(
                          title: Text('About'),
                          content: SingleChildScrollView(
                              child: ListBody(
                            children: <Widget>[
                              Text(
                                  'Experimental app developed by Matheus Misumoto, web developer and journalist based in Santos, Brazil.')
                            ],
                          )),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Visit my website'),
                              onPressed: () async {
                                const url = 'https://matheusmisumoto.jor.br';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                            TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ],
                        )));
              },
              child: Text("About this app"),
            ),
            ElevatedButton(
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
