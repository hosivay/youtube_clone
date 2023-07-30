import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 5, 0),
            child: SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  tabbarItems(
                    isCompass: true
                  ),
                  tabbarItems(
                    title: "All",
                    darkColor: true
                  ),
                  tabbarItems(
                    title: "Gaming"
                  ),
                  tabbarItems(
                    title: "Flutter"
                  ),
                   tabbarItems(
                    title: "Github"
                  ),
                   tabbarItems(
                    title: "Developer"
                  ),
                  tabbarItems(
                    title: "Apple"
                  ),
                  tabbarItems(
                    title: "Google"
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tabbarItems(
      {bool? isCompass = false, String? title = "", bool? darkColor = false}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color:
                darkColor == true ? Colors.grey.shade700 : Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: isCompass == true
                  ? const Icon(CupertinoIcons.compass)
                  : Text(
                      title!,
                      style: TextStyle(
                        color: darkColor == true
                            ? Colors.grey.shade200
                            : Colors.grey.shade800,
                            fontSize: 17
                      ),
                    ),
            ),
          )),
    );
  }
}
