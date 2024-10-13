import 'package:get/get.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';
import 'package:overshare2/repositories/authentication/user_repository.dart';

class FavouriteRepository {
  final UserRepository userRepository = Get.find();
  final AuthenticationRepository authenticationRepository = Get.find();

  Future<List<News>> getAllFavourites(String userId) async {
    try {
      final favouritesSnapshot = await userRepository.db
          .collection('users')
          .doc(userId)
          .collection('favourites')
          .get();

      return favouritesSnapshot.docs.map((doc) {
        return News(
          id: doc.id,
          description: doc.data().containsKey('description')
              ? doc['description']
              : 'No description available', // Fallback if 'description' is missing
          imageAsset: doc.data().containsKey('imageAsset')
              ? doc['imageAsset']
              : 'default_image.png', // Fallback to default image
          name: doc.data().containsKey('name')
              ? doc['name']
              : 'Unknown Name', // Fallback if 'name' is missing
          url: doc.data().containsKey('url')
              ? doc['url']
              : '', // Fallback if 'url' is missing
        );
      }).toList();
    } catch (e) {
      print('ERROR FETCHING DATA!: $e');
      return [];
    }
  }

  //add news to favourite page
  Future<void> addFavourite(News news) async {
    await userRepository.db
        .collection('users')
        .doc(authenticationRepository.userId)
        .collection('favourites')
        .doc(news.id)
        .set({
      'name': news.name,
      'url': news.url,
      'description': news.description,
      'imageAsset': news.imageAsset,
    });
  }

  //remove news from favourite page
  Future<void> removeFavourite(News news) async {
    await userRepository.db
        .collection('users')
        .doc(authenticationRepository.userId)
        .collection('favourites')
        .doc(news.id)
        .delete();
  }

  //get favourite news as stream
  Stream<List<News>> getFavouriteProduct() {
    return userRepository.db
        .collection('users')
        .doc(authenticationRepository.userId)
        .collection('favourites')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return News(
          id: doc.id,
          description: doc.data().containsKey('description')
              ? doc['description']
              : 'No description available', // Fallback if 'description' is missing
          imageAsset: doc.data().containsKey('imageAsset')
              ? doc['imageAsset']
              : 'default_image.png', // Fallback to default image
          name: doc.data().containsKey('name')
              ? doc['name']
              : 'Unknown Name', // Fallback if 'name' is missing
          url: doc.data().containsKey('url')
              ? doc['url']
              : '', // Fallback if 'url' is missing
        );
      }).toList();
    });
  }

  //cek apakah item ada di firebase
  Future<bool> isFavourite(News news) async {
    final docSnapshot = await userRepository.db
        .collection('users')
        .doc(authenticationRepository.userId)
        .collection('favourites')
        .doc(news.id)
        .get();

    return docSnapshot.exists;
  }
}
