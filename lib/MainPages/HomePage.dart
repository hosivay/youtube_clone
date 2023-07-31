import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/database/HomeData.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 5, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    tabbarItems(isCompass: true),
                    tabbarItems(title: "All", darkColor: true),
                    tabbarItems(title: "Gaming"),
                    tabbarItems(title: "Flutter"),
                    tabbarItems(title: "Github"),
                    tabbarItems(title: "Developer"),
                    tabbarItems(title: "Apple"),
                    tabbarItems(title: "Google"),
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
}

Widget videoWidget({
  required BuildContext context,
  required String thumbnail,
  required String titleVideo,
  required String profile,
  required String channelName,
  required int view,
}) {
  return Column(
    children: [
      Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 235,
            color: Colors.red,
            child: Image.network(
              thumbnail,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                      color: Colors.grey.shade900.withOpacity(0.6),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "12:48",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ))
        ],
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: CircleAvatar(
                      radius: 20, backgroundImage: NetworkImage(profile)),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(titleVideo),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "$channelName . $view views . 12 days ago",
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  iconSize: 17,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      )
    ],
  );
}

Widget tabbarItems(
    {bool? isCompass = false, String? title = "", bool? darkColor = false}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          color:
              darkColor == true ? Colors.grey.shade700 : Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
            child: isCompass == true
                ? const Icon(CupertinoIcons.compass)
                : Text(
                    title!,
                    style: TextStyle(
                        color: darkColor == true
                            ? Colors.grey.shade200
                            : Colors.grey.shade800,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
          ),
        )),
  );
}
