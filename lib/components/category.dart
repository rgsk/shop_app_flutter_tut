import 'package:flutter/material.dart';

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
            : Color.fromRGBO(245, 247, 249, 1),
        side: BorderSide(
          color: Color.fromRGBO(245, 247, 249, 1),
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
