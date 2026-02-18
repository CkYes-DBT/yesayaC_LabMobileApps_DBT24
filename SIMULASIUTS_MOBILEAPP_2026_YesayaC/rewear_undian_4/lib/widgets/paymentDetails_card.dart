import 'package:flutter/material.dart';

class PaymentDetailsCard extends StatelessWidget {
  const PaymentDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DetailRow(label: 'Subtotal Product', value: 'Rp389.000'),
        _DetailRow(label: 'Delivery Fee', value: 'Rp10.000'),
        _DetailRow(label: 'Admin Fee', value: 'Rp1.000'),
        _DetailRow(label: 'Discount Fee', value: 'Rp0'),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Total',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp400.000',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
        DottedDivider(),
      ],
    );
  }
}

class DottedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 4.0;
        const dashSpace = 3.0;
        final count = (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          children: List.generate(count, (_) {
            return Container(
              width: dashWidth,
              height: 1,
              margin: const EdgeInsets.only(right: dashSpace),
              color: Colors.grey.shade300,
            );
          }),
        );
      },
    );
  }
}