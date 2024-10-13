import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/views/homepage/aboutapp.dart';
import 'package:overshare2/views/homepage/homepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      floatingActionButton: Container(
        width: screenWidth * 0.9,
        height: 48,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(59)),
            color: Color(0xFF131313)),
        child: Stack(children: [
          _selectedPage == 0
              ? Positioned.fill(
                  right: screenWidth * 0.42,
                  child: Container(
                    width: 179,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF76D00),
                        borderRadius: BorderRadius.all(Radius.circular(59))),
                  ),
                )
              : Positioned.fill(
                  left: screenWidth * 0.42,
                  child: Container(
                    width: 179,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF76D00),
                        borderRadius: BorderRadius.all(Radius.circular(59))),
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
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Homepage',
                        style: GoogleFonts.josefinSans(
                            color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                )),
                // About Button
                Expanded(
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(59)),
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
                          Icons.help_outline,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'About',
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
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(
            withLeading: false,
            backgroundColor: Color(0xFF151515),
            leading: false,
          )),
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
          scrollDirection: Axis.horizontal,
          children: const [HomeScreen(), AboutApp()]),
    );
  }
}
