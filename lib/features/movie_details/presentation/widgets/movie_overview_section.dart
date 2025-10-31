import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import 'section_title.dart';

class MovieOverviewSection extends StatelessWidget {
  final String overview;

  const MovieOverviewSection({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Overview'),
        verticalSpace(8),
        Text(overview, style: const TextStyle(fontSize: 14, height: 1.5)),
      ],
    );
  }
}
