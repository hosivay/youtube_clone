import 'package:flutter/material.dart';
import 'package:youtube_clone/MainPages/HomePage.dart';
import 'package:youtube_clone/MainPages/LibraryPage.dart';
import 'package:youtube_clone/MainPages/ShortsPage.dart';
import 'package:youtube_clone/MainPages/SubscriptionPage.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ShortsPage(),
    const SubscriptionPage(),
    const LibraryPage(),
  ];
  // ignore: non_constant_identifier_names
  final List<String> _nav_title = [
    "Home",
    "Shorts",
    "Subscription",
    "Library",
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentIndex == 1 ? Colors.black87 : Colors.white,
      appBar: _currentIndex == 1
          ? null
          : AppBar(
              title: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCa4EDbkI8ATSXs7s-ovSP2cX_Qfw06aSRWA&usqp=CAU",
                width: 90,
                height: 30,
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              foregroundColor: Colors.black,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cast),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 12,
                    child: Icon(Icons.person, size: 15),
                  ),
                ),
              ],
            ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 48.0,
        color: _currentIndex == 1 ? Colors.grey.shade900 : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            navItem(index: 0, icon: Icons.home_outlined, iconFill: Icons.home),
            navItem(
                index: 1,
                icon: Icons.play_circle_outline,
                iconFill: Icons.play_circle),
            CircleAvatar(
              backgroundColor:
                  _currentIndex == 1 ? Colors.white : Colors.grey.shade900,
              radius: 17,
              child: CircleAvatar(
                  radius: 16,
                  backgroundColor: _currentIndex == 1
                      ? Color.fromARGB(255, 12, 12, 12)
                      : Colors.white,
                  child: Icon(
                    Icons.add,
                    color: _currentIndex == 1
                        ? Colors.white
                        : Colors.grey.shade900,
                    size: 30,
                  )),
            ),
            navItem(
                index: 2,
                icon: Icons.subscriptions_outlined,
                iconFill: Icons.subscriptions),
            navItem(
                index: 3,
                icon: Icons.video_library_outlined,
                iconFill: Icons.video_library),
          ],
        ),
      ),
    );
  }

  Widget navItem(
      {required int index,
      required IconData icon,
      required IconData iconFill}) {
    return Container(
      width: 55,
      height: 45,
      child: InkWell(
        onTap: () {
          _onTabTapped(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(_currentIndex == index ? iconFill : icon,
                color: _currentIndex == 1 ? Colors.white : Colors.grey.shade900,
                size: 26,
                weight: 200),
            const SizedBox(
              height: 5,
            ),
            Text(
              _nav_title[index],
              style:
                  // ignore: unrelated_type_equality_checks
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: index == 2 ? 8 : 10,
                        fontWeight: FontWeight.w400,
                        color: _currentIndex == 1
                            ? Colors.white
                            : Colors.grey.shade900,
                      ),
            )
          ],
        ),
      ),
    );
  }
}
