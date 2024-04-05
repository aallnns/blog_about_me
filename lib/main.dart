import 'package:blog/about_page.dart';
import 'package:blog/contacts_page.dart';
import 'package:blog/home_page.dart';
import 'package:blog/manga_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) {
      return const HomePage();
    },
  ),
  GoRoute(
    path: "/about",
    builder: (context, state) {
      return const AboutPage();
    },
  ),
  GoRoute(
    path: "/contacts",
    builder: (context, state) {
      return const ContactsPage();
    },
  ),
  GoRoute(
    path: "/manga",
    builder: (context, state) {
      return const MangaPage();
    },
  )
]);

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: GoogleFonts.alata().fontFamily),
    );
  }
}
