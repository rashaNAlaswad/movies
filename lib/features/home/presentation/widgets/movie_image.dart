import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/theme/app_colors.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: image.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: image,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.grey,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.grey,
                  child: const Icon(Icons.movie, size: 50),
                ),
              )
            : Container(
                color: AppColors.grey,
                child: const Icon(Icons.movie, size: 50),
              ),
      ),
    );
  }
}
