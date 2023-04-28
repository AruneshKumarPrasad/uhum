import '../Barrel/app_barrel.dart';

class MeditationCategory {
  final String id;
  final int serial;
  final String title;
  final String description;
  final String imageURL;

  MeditationCategory({
    required this.id,
    required this.serial,
    required this.title,
    required this.description,
    required this.imageURL,
  });

  factory MeditationCategory.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MeditationCategory(
      id: data['id'],
      serial: data['serial'],
      title: data['title'],
      description: data['description'] ?? '',
      imageURL: data['imgURL'],
    );
  }
}

class Meditation {
  String id;
  String title;
  String description;
  String audioUrl;
  String imageUrl;

  Meditation({
    required this.id,
    required this.title,
    required this.description,
    required this.audioUrl,
    required this.imageUrl,
  });

  factory Meditation.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return Meditation(
      id: doc.id,
      title: map['title'],
      description: map['description'],
      audioUrl: map['audioUrl'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'audioUrl': audioUrl,
      'imageUrl': imageUrl,
    };
  }
}
