import 'package:flutter/material.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/properties/appbars.dart';

class NewsScreenDetail extends StatelessWidget {
  final News news;
  const NewsScreenDetail({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(
            withLeading: true,
            backgroundColor: Color(0xFF151515),
            leading: true,
          )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            news.imageAsset,
            width: 250,
            height: 250,
          ),
          Text(
            news.name,
            style: const TextStyle(color: Colors.white),
          )
        ],
      )),
    );
  }
}
