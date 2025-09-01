import 'package:flutter/material.dart';
import 'package:todo_app/helper/font.dart';
import 'package:todo_app/helper/color.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Customappbar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppFont.appBarTitleStyle),
      centerTitle: true,
      backgroundColor: AppColors.scaffoldColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
