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

      //stream data
      StreamBuilder(
          stream: favouriteController.getFavouriteNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                'No Favourite News Yet!',
                style:
                    GoogleFonts.josefinSans(fontSize: 16, color: Colors.white),
              ));
            }

            //display favourite news
            return GridView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemBuilder: (context, index) {
                //ngambil list dummy data
                final News news = snapshot.data![index];
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
                                child:
                                    Image(image: AssetImage(news.imageAsset))),
                            Text(
                              news.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // Favorite toggle Button
                            // FutureBuilder(
                            //     future:
                            //         favouriteController.checkFavourite(news),
                            //     builder: (contex, snapshot) {
                            //       if (!snapshot.hasData) {
                            //         return const Center(
                            //           child: CircularProgressIndicator(),
                            //         );
                            //       }
                            //       final isFavourited = snapshot.data!;
                            //       return IconButton(
                            //           onPressed: () {
                            //             if (isFavourited) {
                            //               favouriteController
                            //                   .removeFavourite(news);
                            //             } else {
                            //               favouriteController
                            //                   .addFavourite(news);
                            //             }
                            //           },
                            //           icon: isFavourited
                            //               ? const Icon(
                            //                   Icons.favorite,
                            //                   color: Color.fromARGB(
                            //                       255, 243, 29, 29),
                            //                 )
                            //               : const Icon(
                            //                   Icons.favorite_border_outlined,
                            //                   color:
                            //                       Color.fromARGB(98, 0, 0, 0),
                            //                 ));
                            //     })
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
