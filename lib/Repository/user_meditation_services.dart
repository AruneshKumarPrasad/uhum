import 'package:flutter/foundation.dart';
import '../Barrel/app_barrel.dart';

/// This class provides various services related to meditation, such as
/// fetching meditation categories and recommendations, adding meditation
/// tracks to the recommended list, and more.
class MeditationServices {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference meditationLibraryCollection =
      FirebaseFirestore.instance.collection('meditationLibrary');

  final CollectionReference recommendedLibraryCollection =
      FirebaseFirestore.instance.collection('recommended');

  /// Fetches all meditation categories from the meditation library
  /// Returns a list of MeditationCategory objects.
  Future<List<MeditationCategory>> getAllMeditationsCategories() async {
    List<MeditationCategory> meditationCategories = [];
    try {
      QuerySnapshot querySnapshot =
          await meditationLibraryCollection.orderBy('serial').get();
      for (DocumentSnapshot doc in querySnapshot.docs) {
        meditationCategories.add(MeditationCategory.fromFirestore(doc));
      }
      return meditationCategories;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting meditations: $e');
      }
      rethrow;
    }
  }

  /// Fetches meditation recommendations from the recommended library
  /// Returns a list of Meditation objects.
  Future<List<Meditation>> getMeditationRecommndation() async {
    List<Meditation> meditations = [];
    try {
      QuerySnapshot querySnapshot = await recommendedLibraryCollection
          .doc('meditation')
          .collection('tracks')
          .orderBy('serial')
          .get();
      for (DocumentSnapshot doc in querySnapshot.docs) {
        meditations.add(Meditation.fromFirestore(doc));
      }
      return meditations;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting meditations: $e');
      }
      rethrow;
    }
  }

  Future<List<Meditation>> getMeditationFromCategory(
      {required String categoryID}) async {
    List<Meditation> meditations = [];
    try {
      QuerySnapshot querySnapshot = await meditationLibraryCollection
          .doc(categoryID)
          .collection('tracks')
          .orderBy('serial')
          .get();
      for (DocumentSnapshot doc in querySnapshot.docs) {
        meditations.add(Meditation.fromFirestore(doc));
      }
      return meditations;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting meditations: $e');
      }
      rethrow;
    }
  }

  /// Adds a meditation track to the recommended list
  /// Takes a Meditation object as an input.
  Future<void> addMeditationTrackToRecommended(
      {required Meditation meditation}) async {
    try {
      QuerySnapshot querySnapshot = await recommendedLibraryCollection
          .doc('meditation')
          .collection('tracks')
          .get();
      final int serial = querySnapshot.docs.length + 1;
      Map<String, dynamic> toUpload = meditation.toMap();
      toUpload.addEntries({'serial': serial}.entries);
      await recommendedLibraryCollection
          .doc('meditation')
          .collection('tracks')
          .add(toUpload);
      if (kDebugMode) {
        print('Meditation track added to recommended successfully!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error adding meditation track to recommended: $e');
      }
    }
  }

  /// Fetches the download URL for a given sound file
  /// Returns the URL as a string or null if an error occurs.
  Future<String?> getFileUrl(String soundName) async {
    String filePath = 'meditation/category/randomSounds/$soundName';
    try {
      final ref = _firebaseStorage.ref().child(filePath);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting download URL: $e');
      }
      return null;
    }
  }

  /// Adds a meditation to a user's list of meditations
  /// Takes a user ID and a Meditation object as input.
  Future<void> addMeditationToUser(
    String userId,
    Meditation currentMeditation,
  ) async {
    try {
      await usersCollection.doc(userId).collection('meditations').add(
        {
          'meditationID': currentMeditation.id,
        },
      );
      if (kDebugMode) {
        print('Meditation added to user successfully!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error adding meditation to user: $e');
      }
    }
  }
}
