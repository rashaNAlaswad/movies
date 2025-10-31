import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';

class MovieRating extends StatelessWidget {
  final double voteAverage;

  const MovieRating({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        horizontalSpace(4),
        Text(
          voteAverage.toStringAsFixed(1),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
