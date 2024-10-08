import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Container(
            width: 349,
            height: 48,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(59)),
                color: Color(0xFF131313)),
            child: Stack(children: [
              _selectedPage == 0
                  ? Positioned.fill(
                      right: 169,
                      child: Container(
                        width: 179,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF76D00),
                            borderRadius:
                                BorderRadius.all(Radius.circular(59))),
                      ),
                    )
                  : Positioned.fill(
                      left: 169,
                      child: Container(
                        width: 179,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF76D00),
                            borderRadius:
                                BorderRadius.all(Radius.circular(59))),
                      ),
                    ),
              // Bottom Navbar
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Homepage button
                    Expanded(
                        child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(59)),
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.newspaper,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'News',
                            style: GoogleFonts.josefinSans(
                                color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    )),
                    // About Button
                    Expanded(
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(59)),
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Favorite',
                              style: GoogleFonts.josefinSans(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
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
