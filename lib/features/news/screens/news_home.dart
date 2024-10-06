import 'package:flutter/material.dart';
import 'package:overshare2/features/news/screens/favorite_screen.dart';
import 'package:overshare2/features/news/screens/news_screen.dart';
import 'package:overshare2/properties/appbars.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: _selectedPage == 0
                                ? const Color.fromARGB(255, 102, 104, 104)
                                : const Color.fromARGB(0, 5, 57, 47)),
                        child: const Icon(
                          Icons.newspaper,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const Text(
                        'News',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: _selectedPage == 1
                                ? const Color.fromARGB(255, 102, 104, 104)
                                : const Color.fromARGB(0, 5, 57, 47)),
                        child: Icon(
                          _selectedPage == 1
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const Text(
                        'Favorite',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPage = index;
              });
            },
            scrollDirection: Axis.horizontal,
            children: const [
              NewsScreen(),
              FavoriteScreen(),
            ]));
  }
}
