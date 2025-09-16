import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/setting/views/widgets/info_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Terms of Service',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                title: 'Welcome to Fashion Store',
                content:
                    'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
              ),
              InfoSection(
                title: 'Account Registration',
                content:
                    'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
              ),
              InfoSection(
                title: 'User Responsibilities',
                content:
                    'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
              ),
              InfoSection(
                title: 'Privacy Policy',
                content:
                    'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
              ),
              InfoSection(
                title: 'Intellectual Property',
                content:
                    'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
              ),
              InfoSection(
                title: 'Termination',
                content:
                    'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
              ),
              const SizedBox(height: 24),
              Text(
                'Last updated: March 2024',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodySmall,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
