import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/MainPages/HomePage.dart';
import 'package:youtube_clone/database/HomeData.dart';

import '../database/SubscriptionsData.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 2,
                          height: 108,
                          child: ListView.builder(
                            itemCount: listSubProfile.length,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ChannelAvatar_Sub(
                                profile: listSubProfile[index]["profile"],
                                title: listSubProfile[index]["channelName"],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        height: 107,
                        width: 60,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "All",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
              Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 5, 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    tabbarItems(title: "All", darkColor: true),
                    tabbarItems(title: "Today"),
                    tabbarItems(title: "Live"),
                    tabbarItems(title: "Continue watching"),
                    tabbarItems(title: "Unwatched"),
                    tabbarItems(title: "Posts"),
                  ],
                ),
              ),
            ),
             SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 5,
                child: ListView.builder(
                  itemCount: listVideos.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return videoWidget(
                      context: context,
                      thumbnail: listVideos[index]["thumbnail"],
                      titleVideo: listVideos[index]["titleVideo"],
                      profile: listVideos[index]["profile"],
                      channelName: listVideos[index]["channelName"],
                      view: listVideos[index]["view"],
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ChannelAvatar_Sub({
    required String profile,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(profile),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
