import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShortsPage extends StatelessWidget {
  const ShortsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )),
                  ],
                )),
            Positioned(
                bottom: 70,
                right: 0,
                child: Column(
                  children: [
                    btn_Shorts(icon: Icons.thumb_up_rounded, title: " 3K"),
                    btn_Shorts(
                        icon: Icons.thumb_down_rounded, title: " Dislike"),
                    btn_Shorts(icon: Icons.comment, title: " 765"),
                    btn_Shorts(icon: Icons.reply, title: " Share"),
                    btn_Shorts(icon: Icons.repeat_outlined, title: " Remix"),
                  ],
                )),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 8, 0),
                        child: CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.person,color: Colors.white,size: 17),
                        ),
                      ),
                      Text(
                        "@Hosivay",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "caption",
                          style: TextStyle(color: Colors.white),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Colors.grey.shade800,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget btn_Shorts(
      {required IconData icon, Function()? onTap, required String title}) {
    return Container(
      width: 85,
      height: 85,
      child: Column(
        children: [
          IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: Colors.white,
                size: 31,
              )),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
