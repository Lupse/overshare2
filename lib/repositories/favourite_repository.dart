import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';
import 'package:overshare2/repositories/authentication/user_repository.dart';

class FavouriteRepository extends GetxController {
  final UserRepository userRepository = Get.find();
  final AuthenticationRepository authenticationRepository = Get.find();
  get getCurrentUserData => userRepository.db
      .collection('users')
      .doc(authenticationRepository.userId);

  //fetch favourited news dari firebase
  Future<List<News>> fetchFavouritedNews() async {
    try {
      QuerySnapshot querySnapshot = await getCurrentUserData
          .collection('favourites')
          .where('initialized', isEqualTo: true)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs
            .map((doc) =>
                News.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('NO DATA FOUND (favourite repo) : $e');
    }
  }

  //add news to favourite page
  Future<void> addFavourite(News news) async {
    await getCurrentUserData.collection('favourites').doc(news.id).set({
      'name': news.name,
      'url': news.url,
      'description': news.description,
      'imageAsset': news.imageAsset,
      'logoImageAsset' : news.logoImageAsset,
      'author' : news.logoImageAsset,
      'date' : news.date,
      'initialized': true
    });
  }

  //remove news from favourite page
  Future<void> removeFavourite(News news) async {
    await getCurrentUserData.collection('favourites').doc(news.id).delete();
  }

  //cek apakah item ada di firebase
  Future<bool> isFavourite(News news) async {
    final docSnapshot =
        await getCurrentUserData.collection('favourites').doc(news.id).get();

    return docSnapshot.exists;
  }
}
