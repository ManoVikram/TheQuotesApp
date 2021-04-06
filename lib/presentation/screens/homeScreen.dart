import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/quoteWithAuthor.dart';

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

    final CollectionReference quotes =
        FirebaseFirestore.instance.collection("quotes");

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
        child: StreamBuilder<QuerySnapshot>(
          stream: quotes.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "ERROR: Please try again later.",
                  style: TextStyle(
                    fontFamily: GoogleFonts.arizonia().fontFamily,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                reverse: true,
                children: snapshot.data.docs.map(
                  (DocumentSnapshot document) {
                    return QuoteWithAuthor(
                      colors: colors,
                      size: size,
                      quote: document.data()["quote"],
                      author: document.data()["author"],
                    );
                  },
                ).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
