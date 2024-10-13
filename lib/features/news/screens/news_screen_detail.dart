import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/news/controllers/favourite_controller.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/properties/button.dart';

class NewsScreenDetail extends StatelessWidget {
  final News news;
  const NewsScreenDetail({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final FavouriteController favouriteController = Get.find();
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(
            withLeading: true,
            backgroundColor: Color(0xFF151515),
            leading: true,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header (Image & Logo)
            Stack(
              children: [
                // Background Image
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(news.imageAsset),
                          fit: BoxFit.cover)),
                  width: double.infinity,
                  height: 180,
                ),

                // Background Color Layer
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(30, 21, 21, 21),
                    Color.fromARGB(210, 21, 21, 21),
                    Color(0xFF151515),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),

                // Logo
                Positioned(
                  left: 0.4 * screenWidth,
                  bottom: 0,
                  child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image(image: AssetImage(news.logoImageAsset))),
                )
              ],
            ),

            // Title
            Padding(
              padding: const EdgeInsets.only(top: 14.0, left: 12, right: 12),
              child: Text(
                news.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Date
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                'Published by ${news.author}',
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                    fontSize: 14,
                    color: const Color.fromARGB(85, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Writer
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                news.date,
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                    fontSize: 14,
                    color: const Color.fromARGB(85, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Descriptiion
            Padding(
              padding: const EdgeInsets.only(top: 42.0, left: 12, right: 12),
              child: Text(
                news.description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.josefinSans(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Button
            Padding(
              padding: const EdgeInsets.only(top: 42.0),
              child: SizedBox(
                  width: 300,
                  height: 40,
                  child: MyButton(
                      text: 'Read More',
                      onPressed: () =>
                          favouriteController.launchUrl(news.url))),
            )
          ],
        ),
      ),
    );
  }
}
