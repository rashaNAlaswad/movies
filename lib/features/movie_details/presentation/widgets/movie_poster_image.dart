import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePosterImage extends StatelessWidget {
  final String imageUrl;

  const MoviePosterImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 120,
        height: 180,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            Container(width: 120, height: 180, color: Colors.grey[300]),
        errorWidget: (context, url, error) => Container(
          width: 120,
          height: 180,
          color: Colors.grey[300],
          child: const Icon(Icons.movie),
        ),
      ),
    );
  }
}
