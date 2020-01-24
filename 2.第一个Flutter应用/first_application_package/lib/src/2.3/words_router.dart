import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordsRouter extends StatelessWidget {
  final _wordPair = WordPair.random(maxSyllables: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Words Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_wordPair.toString()),
          ],
        ),
      ),
    );
  }
}