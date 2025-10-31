import 'package:flutter/material.dart';

class MovieReleaseYear extends StatelessWidget {
  final String releaseDate;

  const MovieReleaseYear({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    final year = releaseDate.isNotEmpty ? releaseDate.split('-')[0] : '';

    return Text(year, style: TextStyle(fontSize: 12, color: Colors.grey[600]));
  }
}
