import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';

class MovieRatingInfo extends StatelessWidget {
  final double voteAverage;

  const MovieRatingInfo({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        horizontalSpace(4),
        Text(
          voteAverage.toStringAsFixed(1),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
