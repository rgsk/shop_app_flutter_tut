import 'package:flutter/material.dart';
import 'package:shop_app_flutter_tut/utils/app_colors.dart';

class Category extends StatelessWidget {
  final String filter;
  final bool active;
  final Function() onTap;

  const Category({
    super.key,
    required this.filter,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        backgroundColor: active
            ? Theme.of(context).colorScheme.primary
            : AppColors.lightBlue,
        side: BorderSide(
          color: AppColors.lightBlue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        label: Text(filter),
        labelStyle: TextStyle(fontSize: 16),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
      ),
    );
  }
}
