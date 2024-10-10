import 'package:get/get.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';
import 'package:overshare2/repositories/favourite_repository.dart';

class FavouriteController extends GetxController {
  final FavouriteRepository favouriteRepository = Get.find();
  final AuthenticationRepository authenticationRepository = Get.find();

  //store list of favourites
  RxList<News> favouritedNews = <News>[].obs;

  @override
  void onInit() {
    loadFavourites();
    super.onInit();
  }
  //static (tanpa firebase)
  // var toggleFavourite = <News>[].obs;

  Future<void> loadFavourites() async {
    final favourites = await favouriteRepository
        .getAllFavourites(authenticationRepository.userId.toString());
    favouritedNews.assignAll(favourites);
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
    return favouriteRepository.getFavourtiteProduct();
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
