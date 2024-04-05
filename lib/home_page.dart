import 'package:blog/blog_manager.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();

    BlogManager.instance.getPosts().then((value) {
      posts.addAll(value["posts"]);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('IMG_20230814_000306_246.jpg'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      const Spacer(),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(96),
                          child: Image.asset('photo_2024-02-16_11-35-17.jpg',
                              width: 192, height: 192)),
                      const SizedBox(height: 16),
                      const Text("aallnns",
                          style: TextStyle(
                              color: Color.fromARGB(133, 177, 9, 9),
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      const SizedBox(height: 14),
                      const Text("Programist",
                          style: TextStyle(
                              color: Color.fromARGB(255, 158, 141, 141),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        height: 4,
                        width: 64,
                        color: const Color.fromARGB(133, 177, 9, 9),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(width: 32),
                          IconButton(
                              onPressed: () async {
                                await launchUrlString(
                                    "https://www.facebook.com/profile.php?id=100055829048535");
                              },
                              icon:
                                  const Icon(CommunityMaterialIcons.facebook)),
                          IconButton(
                              onPressed: () async {
                                await launchUrlString(
                                    "https://www.instagram.com/aallnns_/");
                              },
                              icon:
                                  const Icon(CommunityMaterialIcons.instagram)),
                          IconButton(
                              onPressed: () async {
                                await launchUrlString(
                                    "https://www.linkedin.com/feed/");
                              },
                              icon:
                                  const Icon(CommunityMaterialIcons.linkedin)),
                          IconButton(
                              onPressed: () async {
                                await launchUrlString(
                                    "https://github.com/aallnns");
                              },
                              icon: const Icon(CommunityMaterialIcons.github)),
                          const SizedBox(width: 32),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                context.go("/about");
                              },
                              child: const Text(
                                "About",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 158, 141, 141),
                                    fontWeight: FontWeight.bold),
                              )),
                          const SizedBox(width: 4),
                          const Text("•"),
                          const SizedBox(width: 4),
                          TextButton(
                              onPressed: () {
                                context.go("/contacts");
                              },
                              child: const Text(
                                "Contacts",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 158, 141, 141),
                                    fontWeight: FontWeight.bold),
                              )),
                          const SizedBox(width: 4),
                          const Text("•"),
                          const SizedBox(width: 4),
                          TextButton(
                              onPressed: () {
                                context.go("/manga");
                              },
                              child: const Text(
                                "Manga",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 158, 141, 141),
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  ),
                ))),
        Expanded(
            flex: 6,
            child: ListView(
              children: [
                for (final post in posts)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post["title"],
                          style: const TextStyle(
                              fontSize: 32,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 0, 0, 0),
                              height: 0.9),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post["body"],
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  )
              ],
            )),
      ],
    ));
  }
}
