import 'package:flutter/material.dart';

import '../widgets/quoteWIthAuthor.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homePage";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<Color> colors = [
      Colors.redAccent,
      Colors.blueGrey,
      Colors.indigo,
      Colors.green,
      Colors.amber,
      Colors.pinkAccent,
      Colors.purple,
    ];

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          reverse: true,
          children: [
            QuoteWithAuthor(
              colors: colors,
              size: size,
              quote: "Stay Hungry, Stay Foolish",
              author: "Steve Jobs",
            ),
          ],
        ),
      ),
    );
  }
}
