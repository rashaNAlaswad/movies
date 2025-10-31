import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import 'section_title.dart';

import 'financial_info.dart';

class MovieFinancialSection extends StatelessWidget {
  final int budget;
  final int revenue;

  const MovieFinancialSection({
    super.key,
    required this.budget,
    required this.revenue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Financial Information'),
        verticalSpace(8),
        if (budget > 0) FinancialInfo(label: 'Budget', amount: budget),
        if (revenue > 0) FinancialInfo(label: 'Revenue', amount: revenue),
      ],
    );
  }
}
