import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_favPlace.dart';
import 'package:favorite_places/widgets/FavPlace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlaces extends ConsumerWidget {
  const FavoritePlaces({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvide);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Places"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddFavPlace()),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: FavPlace(
        places: userPlaces,
      ),
    );
  }
}
