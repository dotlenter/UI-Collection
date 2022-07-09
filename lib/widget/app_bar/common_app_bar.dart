import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_collection/widget/app_bar/common_app_bar_type.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  final List<Widget> actions;
  final CommonAppBarType appBarType;
  final bool centeredTitle;

  const CommonAppBar({
    Key? key,
    this.actions = const [],
    this.appBarType = CommonAppBarType.normal,
    this.centeredTitle = false,
    required this.pageTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            if (appBarType == CommonAppBarType.sub) ...[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  FontAwesomeIcons.circleArrowLeft,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(
                pageTitle,
                textAlign: centeredTitle ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  height: 1.29,
                ),
              ),
            ),
            ...actions,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
