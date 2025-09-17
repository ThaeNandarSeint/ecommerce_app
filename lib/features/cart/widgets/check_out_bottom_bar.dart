import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CheckOutBottomBar extends StatelessWidget {
  const CheckOutBottomBar({
    super.key,
    required this.totalAmount,
    required this.onPlaceOrder,
  });

  final double totalAmount;
  final VoidCallback onPlaceOrder;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withAlpha((0.2 * 255).round())
                  : Colors.grey.withAlpha((0.1 * 255).round()),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPlaceOrder,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Place Order (\$${totalAmount.toStringAsFixed(2)})',
            style: AppTextStyle.withColor(
              AppTextStyle.buttonMedium,
              Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
