import 'package:flutter/material.dart';

class DeliveryOption extends StatelessWidget {
  final String name;
  final String estimate;
  final String price;
  final bool isSelected;
  final bool isSupported;
  final VoidCallback? onTap;

  const DeliveryOption({
    super.key,
    required this.name,
    required this.estimate,
    required this.price,
    required this.isSelected,
    required this.isSupported,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.black87 : Colors.grey.shade200,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: isSupported ? Colors.black : Colors.grey.shade400,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '( $estimate )',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
              ),
            ),
            const Spacer(),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: isSupported ? Colors.black : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}