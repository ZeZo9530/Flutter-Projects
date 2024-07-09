import 'package:flutter/material.dart';

class PlayerCard extends StatefulWidget {
  const PlayerCard({
    super.key,
    required this.names,
  });

  final String names;

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  int points = 0;
  void _addPoints() {
    setState(
      () {
        points++;
      },
    );
  }

  void _removePoints() {
    setState(
      () {
        points--;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              widget.names,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  "$points",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                  onPressed: _addPoints,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            IconButton(
              onPressed: _removePoints,
              icon: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
