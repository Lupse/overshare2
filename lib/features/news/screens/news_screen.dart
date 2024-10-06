import 'package:flutter/material.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/properties/appbars.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

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
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                //ngambil list dummy data
                final news = newsList[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset(
                        news.imageAsset,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(news.name),
                      subtitle: Text(news.description),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
