import 'package:get/get.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';
import 'package:overshare2/repositories/authentication/user_repository.dart';

class FavouriteRepository {
  final UserRepository userRepository = Get.find();
  final AuthenticationRepository authenticationRepository = Get.find();

  Future<List<News>> getAllFavourites(String userId) async {
    final favouritesSnapshot = await userRepository.db
        .collection('users')
        .doc(userId)
        .collection('favourites')
        .get();

    return favouritesSnapshot.docs.map((doc) {
      return News(
        id: doc.id,
        name: doc['name'],
        description: doc['description'],
        imageAsset: doc['imageAsset'],
        url: doc['url'],
      );
    }).toList();
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
  Stream<List<News>> getFavourtiteProduct() {
    return userRepository.db
        .collection('users')
        .doc(authenticationRepository.userId)
        .collection('favourites')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return News(
            id: doc.id,
            name: doc['name'],
            description: doc['description'],
            imageAsset: doc['imageAsset'],
            url: doc['url']);
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
