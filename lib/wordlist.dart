import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Wordlist extends StatefulWidget {
  const Wordlist({Key? key}) : super(key: key);

  @override
  _Wordlist createState() => _Wordlist();
}

class _Wordlist extends State<Wordlist> {
  final suggestions = [];
  final saved = [];

  void initState() {
    suggestions.addAll(generateWordPairs().take(100));
  }

  @override
  Widget build(BuildContext context) {
    // for (var i = 0; i < 100; i++) {
    //   var wordPair = WordPair.random();
    //   suggestions.add(wordPair);
    // }
    suggestions.addAll(generateWordPairs().take(100));

    return Scaffold(
        appBar: AppBar(title: Text("Listview page")),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              trailing: Icon(
                  saved.contains(suggestions[index])
                      ? Icons.favorite
                      : Icons.favorite,
                  color:
                      saved.contains(suggestions[index]) ? Colors.red : null),
              onTap: () {
                setState(() {
                  if (saved.contains(suggestions[index])) {
                    saved.remove(suggestions[index]);
                  } else {
                    saved.add(suggestions[index]);
                  }
                });
              },
              title: Text(
                suggestions[index].asPascalCase,
                style: TextStyle(color: Colors.blue),
              ),
            );
          },
          itemCount: suggestions.length,
        ));
  }
}
