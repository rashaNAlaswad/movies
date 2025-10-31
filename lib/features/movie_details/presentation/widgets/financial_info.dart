import 'package:flutter/material.dart';

class FinancialInfo extends StatelessWidget {
  final String label;
  final int amount;

  const FinancialInfo({super.key, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    final formattedAmount = amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );

    return Text(
      '$label: \$$formattedAmount',
      style: const TextStyle(fontSize: 14),
    );
  }
}
