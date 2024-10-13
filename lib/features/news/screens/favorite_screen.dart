import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/news/controllers/favourite_controller.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/features/news/screens/news_screen_detail.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavouriteController favouriteController = Get.find();
    return Column(children: [
      //text favourited
      Text(
        "Favorited News",
        style: GoogleFonts.josefinSans(fontSize: 36, color: Colors.white),
      ),

      //body

      Obx(() {
        if (favouriteController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (favouriteController.favouritedNews.isEmpty) {
          return Center(
            child: Text(
              'No Favourited Item Yet!',
              style: GoogleFonts.josefinSans(fontSize: 16, color: Colors.white),
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.7),
          itemCount: favouriteController.favouritedNews.length,
          itemBuilder: (context, index) {
            //ngambil list dummy data
            News news = favouriteController.favouritedNews[index];
            //card widget
            return Card(
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  //pindah ke detail screen
                  onTap: () {
                    Get.to(NewsScreenDetail(news: news));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: Image(image: AssetImage(news.imageAsset))),
                        Text(
                          news.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        );
      })
    ]);
  }
}
