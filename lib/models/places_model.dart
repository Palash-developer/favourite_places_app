import "dart:io";

import "package:uuid/uuid.dart";

const uuid = Uuid();

class Place {
  final String id;
  final String title;
  final File? img;

  Place({required this.img, required this.title}) : id = uuid.v4();
}
