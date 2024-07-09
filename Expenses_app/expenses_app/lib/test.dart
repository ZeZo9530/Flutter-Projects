import 'dart:math';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

String _generateRandom(List<String> noun) {
  final _random = new Random();

  var element = noun[_random.nextInt(noun.length)];
  return element;
}

String boog = "a";

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    List<String> nouns = ["a", "b", "c", "d", "e", "f"];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              boog,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    boog = _generateRandom(nouns);
                  });
                },
                icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
