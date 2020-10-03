import 'dart:math';

class QuotesDB {
  List<Map<String, String>> quotes = [
    {
      'quote':
          'Some people see innovation as change, but we have never really seen it like that. It’s making things better.',
      'author': 'Tim Cook',
      'description': 'Apple CEO',
    },
    {
      'quote':
          'In a world filled with hate, we must still dare to hope. In a world filled with anger, we must still dare to comfort. In a world filled with despair, we must still dare to dream. And in a world filled with distrust, we must still dare to believe.',
      'author': 'Michael Jackson',
      'description': 'King of the Pop',
    },
    {
      'quote':
          'Change will not come if we wait for some other person, or if we wait for some other time. We are the ones we\'ve been waiting for. We are the change that we seek.',
      'author': 'Barack Obama',
      'description': '44th President of the United States',
    },
    {
      'quote':
          'Two things are infinite: the universe and human stupidity; and I\'m not sure about the universe.',
      'author': 'Albert Einstein',
      'description': 'Theoretical physicist',
    },
    {
      'quote':
          'You have to understand, most people are not ready to be unplugged...',
      'author': 'Captain Morpheus',
      'description': 'The Matrix (Movie)',
    },
    {
      'quote': 'Bazinga!',
      'author': 'Dr. Sheldon Lee Cooper',
      'description': 'The Big Bang Theory (TV Show)',
    },
    {
      'quote': 'Pivot! Pivot! Pivot!',
      'author': 'Ross Geller',
      'description': 'Friends (TV Show)',
    },
/*
    {
      'quote': '',
      'author': '',
      'description': '',
    },
*/
  ];

  QuotesDB();

  giveMeQuote() {
    int _random = Random().nextInt(quotes.length);
    return quotes[_random];
  }
}
