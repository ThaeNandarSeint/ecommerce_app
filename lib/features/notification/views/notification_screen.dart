import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/notification/models/notification.dart';
import 'package:ecommerce_app/features/notification/repositories/notification_repository.dart';
import 'package:ecommerce_app/features/notification/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationRepository _repository = NotificationRepository();

  Widget _buildNotificationCard(
    BuildContext context,
    NotificationItem notification,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: notification.isRead
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withAlpha((0.2 * 255).round())
                : Colors.grey.withAlpha((0.1 * 255).round()),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: NotificationUtil.getIconBackgroundColor(
              context,
              notification.type,
            ),
            shape: BoxShape.circle,
          ),
          child: Icon(
            NotificationUtil.getNotificationIcon(notification.type),
            color: NotificationUtil.getIconColor(context, notification.type),
          ),
        ),
        title: Text(
          notification.title,
          style: AppTextStyle.withColor(
            AppTextStyle.bodyLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.message,
              style: AppTextStyle.withColor(
                AppTextStyle.bodySmall,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final notifications = _repository.getNotifications();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Notifications',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all as read',
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (ctx, index) =>
            _buildNotificationCard(context, notifications[index]),
      ),
    );
  }
}
