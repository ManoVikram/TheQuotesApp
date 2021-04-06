import 'dart:math';

import 'package:flutter/material.dart';

import './quote.dart';
import './authorName.dart';

class QuoteWithAuthor extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteWithAuthor({
    Key key,
    @required this.colors,
    @required this.size,
    this.quote,
    this.author,
  }) : super(key: key);

  final List<Color> colors;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 500,
      ),
      color: colors[Random().nextInt(colors.length)],
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Quote(
            size: size,
            quote: quote,
          ),
          SizedBox(
            height: 14.0,
          ),
          AuthorName(
            authorName: author,
          ),
        ],
      ),
    );
  }
}
