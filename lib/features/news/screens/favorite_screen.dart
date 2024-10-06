import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/features/news/screens/news_screen_detail.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Favorited News",
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
