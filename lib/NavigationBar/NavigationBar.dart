import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';
import 'package:youtube_clone/MainPages/HomePage.dart';
import 'package:youtube_clone/MainPages/LibraryPage.dart';
import 'package:youtube_clone/MainPages/ShortsPage.dart';
import 'package:youtube_clone/MainPages/SubscriptionPage.dart';
import 'package:youtube_clone/VideoPage.dart';
import 'package:youtube_clone/database/HomeData.dart';

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
      body: _currentIndex != 1
          ? WeSlide(
              appBar: _currentIndex == 1 ? null : yt_AppBar(context),
              footer: yt_NavigationBar(),
              hideFooter: true,
              footerController: WeSlideController(initial: true),
              panelMinSize: 110.0,
              panelMaxSize: MediaQuery.of(context).size.height * 1.1,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              footerHeight: 48,
              body: Container(
                child: _pages[_currentIndex],
              ),
              panel: VideoPage(
                  channelName: listVideos[1]["channelName"],
                  profile: listVideos[1]["profile"],
                  thumbnail: listVideos[1]["thumbnail"],
                  titleVideo: listVideos[1]["titleVideo"],
                  view: listVideos[1]["view"],
                  sub: listVideos[1]["sub"]),
              panelHeader: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            width: MediaQuery.sizeOf(context).width / 3.2,
                            color: Colors.black,
                            child: Image.network(
                              listVideos[1]["thumbnail"],
                              width: MediaQuery.sizeOf(context).width / 3.2,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(listVideos[1]["titleVideo"]),
                          ),
                          Text(
                            listVideos[1]["channelName"],
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.pause,
                                color: Colors.black,
                                size: 27,
                              )),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 27,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : _pages[_currentIndex],
      bottomNavigationBar: _currentIndex == 1 ? yt_NavigationBar() : null,
    );
  }

  // ignore: non_constant_identifier_names
  AppBar yt_AppBar(BuildContext context) {
    return AppBar(
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
    );
  }

  // ignore: non_constant_identifier_names
  Widget yt_NavigationBar() {
    return Container(
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
                    ? const Color.fromARGB(255, 12, 12, 12)
                    : Colors.white,
                child: Icon(
                  Icons.add,
                  color:
                      _currentIndex == 1 ? Colors.white : Colors.grey.shade900,
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
    );
  }

  Widget navItem(
      {required int index,
      required IconData icon,
      required IconData iconFill}) {
    return SizedBox(
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
