import 'package:ecommerce_app/features/product/data/product_data.dart';
import 'package:ecommerce_app/features/product/views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/home/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ProductDetailScreen(product: product),
            ),
          ),
          child: ProductCard(product: product),
        );
      },
    );
  }
}
