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
    fetchFavouritedNews();
    super.onReady();
  }

  Future<void> fetchFavouritedNews() async {
    try {
      isLoading.value = true;
      var fetchedNews = await favouriteRepository.fetchFavouritedNews();
      if (fetchedNews.isNotEmpty) {
        favouritedNews.assignAll(fetchedNews);
      } else {}
    } catch (e) {
      throw Exception("ERROR FETCHING DATA (favourite controller) : $e");
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
