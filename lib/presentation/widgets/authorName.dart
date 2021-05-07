import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorName extends StatelessWidget {
  final String authorName;

  const AuthorName({
    Key key,
    this.authorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        authorName == null ? "" : "~ $authorName",
        style: TextStyle(
          fontFamily: GoogleFonts.oxygen().fontFamily,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
