import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_clone/database/LibraryData.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                          "https://s2.uupload.ir/files/20221219_164624_5tuc.jpg"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Text(
                        "Hossein Valipour",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        iconSize: 50,
                        onPressed: () {
                          openUrl(siteLink);
                        },
                        icon: const Icon(LineIcons.globe)),
                    IconButton(
                        iconSize: 50,
                        onPressed: () {
                          openUrl(instagramLink);
                        },
                        icon: const Icon(LineIcons.instagram)),
                    IconButton(
                        iconSize: 50,
                        onPressed: () {
                          openUrl(githubLink);
                        },
                        icon: const Icon(LineIcons.github)),
                    IconButton(
                        iconSize: 50,
                        onPressed: () {
                          openUrl(telegramLink);
                        },
                        icon: const Icon(LineIcons.telegram)),
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text("v$ver"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void openUrl(String link) async {
  final Uri url = Uri.parse(link);
  try {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
  }
}


