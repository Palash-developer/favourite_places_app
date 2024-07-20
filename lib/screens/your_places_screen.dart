import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favourite_places_app/providers/user_places.dart';
import 'package:favourite_places_app/screens/add_places_screen.dart';
import 'package:favourite_places_app/widgets/places_list.dart';

class YourPlacesScreen extends ConsumerWidget {
  const YourPlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        backgroundColor: Theme.of(context).colorScheme.scrim,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (ctx) => const AddPlacesForm(),
                ),
              );
            },
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: PlacesList(
        places: userPlaces,
      ),
    );
  }
}
