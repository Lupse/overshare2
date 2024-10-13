import 'package:get/get.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';
import 'package:overshare2/repositories/favourite_repository.dart';

class FavouriteController extends GetxController {
  final FavouriteRepository favouriteRepository = Get.find();
  final AuthenticationRepository authenticationRepository = Get.find();

  //store list of favourites
  var favouritedNews = <News>[].obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    loadFavourites();
  }
  //static (tanpa firebase)
  // var toggleFavourite = <News>[].obs;

  Future<void> loadFavourites() async {
    try {
      isLoading.value = true;
      var favourites = await favouriteRepository
          .getAllFavourites(authenticationRepository.userId.toString());
      favouritedNews.assignAll(favourites);
    } catch (e) {
      print('ERROR LOAD DATA!: $e');
    } finally {
      isLoading.value = false;
    }
  }

  //add favourite
  Future<void> addFavourite(News news) async {
    await favouriteRepository.addFavourite(news);
    favouritedNews.add(news);

    //static (tanpa firebase)
    // if (!toggleFavourite.contains(news)) {
    //   toggleFavourite.add(news);
    // }
  }

  //remove favourite
  Future<void> removeFavourite(News news) async {
    await favouriteRepository.removeFavourite(news);
    favouritedNews.remove(news);

    //static (tanpa firebase)
    // if (toggleFavourite.contains(news)) {
    //   toggleFavourite.remove(news);
    // }
  }

  Stream<List<News>> getFavouriteNews() {
    return favouriteRepository.getFavouriteProduct();
  }

  //cek udah favourite atau belum
  // Check if the news is already favourited
  bool isFavourite(News news) {
    return favouritedNews.any((item) => item.id == news.id);
  }
  //check is item favourite or not (static tanpa firebase)
  // bool checkFavourite(News news) {
  //   return toggleFavourite.contains(news);
  // }
}
