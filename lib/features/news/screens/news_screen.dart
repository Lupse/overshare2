import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/news/controllers/favourite_controller.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/features/news/screens/news_screen_detail.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  // indikator favorit
  final FavouriteController favouriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "What's new?",
          style: GoogleFonts.josefinSans(fontSize: 36, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: newsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            itemBuilder: (context, index) {
              //ngambil list dummy data
              final News news = newsList[index];
              //card nya
              return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: InkWell(
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

                          
                          // Favorite Button
                          Obx(() =>
                              // favouriteController.isFavourited.value =
                              //     snapshot.data!;
                              IconButton(
                                onPressed: () {
                                  if (favouriteController.isFavourite(news)) {
                                    favouriteController.removeFavourite(news);
                                  } else {
                                    favouriteController.addFavourite(news);
                                  }
                                },
                                icon: favouriteController.isFavourite(news)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Color.fromARGB(255, 243, 29, 29),
                                      )
                                    : const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Color.fromARGB(98, 0, 0, 0),
                                      ),
                              ))
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
