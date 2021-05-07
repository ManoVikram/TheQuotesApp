import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quote extends StatelessWidget {
  final String quote;

  const Quote({
    Key key,
    @required this.size,
    this.quote,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      quote,
      wrapWords: false,
      textAlign: TextAlign.center,
      softWrap: true,
      minFontSize: 14.0,
      maxFontSize: 32.0,
      maxLines: 7,
      style: TextStyle(
        fontFamily: GoogleFonts.exo().fontFamily,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }
}
