import 'package:case_study/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.trailingText,
  });

  final String title;
  final String leadingIcon;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageIcon(AssetImage(leadingIcon), size: 32, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: trailingText == null
          ? const Icon(
              Icons.north_east_rounded,
              color: Color(0xFFC7C7CC),
              size: 16,
            )
          : Text(
              trailingText!,
              style: TextStyle(color: AppColors.textColor.withOpacity(0.6), fontSize: 13),
            ),
    );
  }
}
