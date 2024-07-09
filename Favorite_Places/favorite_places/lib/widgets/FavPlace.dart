import 'package:favorite_places/models/places.dart';
import 'package:favorite_places/screens/place_details.dart';

import 'package:flutter/material.dart';

class FavPlace extends StatelessWidget {
  const FavPlace({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    List<Place> favPlaces = places;
    if (favPlaces.isEmpty) {
      return Center(
        child: Text(
          "No  places  added.",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: favPlaces.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 12,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(
            favPlaces[index].title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlaceDetails(place: favPlaces[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
