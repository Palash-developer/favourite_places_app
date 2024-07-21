import 'dart:io';

import 'package:favourite_places_app/models/places_model.dart';
import 'package:favourite_places_app/screens/places_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No places added yet...",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 24),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].img!),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (ctx) => PlaceDetailsScreen(place: places[index]),
              ),
            );
          },
        );
      },
    );
  }
}
