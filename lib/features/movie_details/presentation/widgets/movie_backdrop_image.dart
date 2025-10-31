import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieBackdropImage extends StatelessWidget {
  final String backdropPath;

  const MovieBackdropImage({super.key, required this.backdropPath});

  @override
  Widget build(BuildContext context) {
    if (backdropPath.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: backdropPath,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: Colors.grey[300]),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[300],
          child: const Icon(Icons.movie, size: 50),
        ),
      );
    }
    return Container(
      color: Colors.grey[300],
      child: const Icon(Icons.movie, size: 50),
    );
  }
}
