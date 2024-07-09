import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_app/data/words.dart';
import 'package:game_app/widgets/AddPlayer.dart';
import 'package:game_app/widgets/PlayerCards.dart';

class RandomNoun extends StatefulWidget {
  const RandomNoun({super.key});

  @override
  State<RandomNoun> createState() => _RandomNounState();
}

String _generateRandom(List<String> noun) {
  final random = Random();

  var element = noun[random.nextInt(noun.length)];
  return element;
}

String theWord = "Start the game";

class _RandomNounState extends State<RandomNoun> {
  final List<String> playerNames = [];

  void openAddPlayer() {
    showModalBottomSheet(
        context: context,
        builder: (context) => AddPlayer(
              onAddPlayer: _addNewPlayer,
            ));
  }

  void _addNewPlayer(String name) {
    setState(() {
      playerNames.add(name);
    });
  }

  void _removePlayer(String name) {
    setState(() {
      playerNames.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    String noun = newWords;
    List<String> nouns = noun.split(" ");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess the word"),
        actions: [
          IconButton(
            onPressed: openAddPlayer,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                theWord,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 26),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  theWord = _generateRandom(nouns);
                });
              },
              icon: const Icon(Icons.navigate_next),
            ),
            PlayerCards(
              names: playerNames,
              removePlayer: _removePlayer,
            )
          ],
        ),
      ),
    );
  }
}
