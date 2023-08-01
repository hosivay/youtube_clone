import 'package:flutter/material.dart';
import 'package:youtube_clone/MainPages/HomePage.dart';
import 'package:youtube_clone/database/HomeData.dart';

class VideoPage extends StatelessWidget {
  const VideoPage(
      {super.key,
      required this.channelName,
      required this.profile,
      required this.thumbnail,
      required this.titleVideo,
      required this.view,
      required this.sub});

  final String channelName, profile, thumbnail, titleVideo, sub;
  final int view;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 220,
                  color: Colors.red,
                  child: Image.network(thumbnail),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width / 3,
                          height: 3,
                          color: Colors.red,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width / 6,
                          height: 3,
                          color: Colors.grey.shade200.withOpacity(0.6),
                        ),
                      ],
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 11, 16, 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        titleVideo,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "$view views 50 min ago",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(profile),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            channelName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sub,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        const Spacer(),
                        btn_VideoPage(
                          child: const Row(
                            children: [
                              Icon(Icons.notifications_none),
                              Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      btn_VideoPage(
                        padding: 5,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.thumb_up_outlined,
                                size: 22,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text("605"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 1,
                                height: 17,
                                color: Colors.grey,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(11, 3, 8, 3),
                              child: Icon(
                                Icons.thumb_down_outlined,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      btn_VideoPage(
                          child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.reply_outlined,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text("Share"),
                          )
                        ],
                      )),
                      btn_VideoPage(
                          child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.library_add_outlined,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text("Save"),
                          )
                        ],
                      )),
                    ],
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              scrollDirection: Axis.vertical,
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
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget btn_VideoPage({required Widget child, double? padding = 2}) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
            color: Colors.grey.shade200,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(9, 5, 9, 5), child: child)),
      ),
    );
  }
}
