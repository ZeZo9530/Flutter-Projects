import 'package:flutter/material.dart';
import 'package:game_app/widgets/Player.dart';

class PlayerCards extends StatelessWidget {
  const PlayerCards(
      {super.key, required this.names, required this.removePlayer});
  final List<String> names;
  final void Function(String name) removePlayer;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: names.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Theme.of(context)
                .copyWith()
                .colorScheme
                .onPrimaryContainer
                .withOpacity(0.75),
          ),
        ),
        key: ValueKey(names[index]),
        onDismissed: (direction) {
          removePlayer(names[index]);
        },
        child: PlayerCard(
          names: names[index],
        ),
      ),
    );
  }
}
