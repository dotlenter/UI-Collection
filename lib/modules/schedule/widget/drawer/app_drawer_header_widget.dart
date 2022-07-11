import 'package:flutter/material.dart';

import 'user_details_widget.dart';

class AppDrawerHeaderWidget extends StatelessWidget {
  const AppDrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 24,
        top: 68,
        bottom: 24,
      ),
      child: UserDetailsWidget(
        firstName: 'Mobile',
        lastName: 'Developer',
        position: 'Intern',
      ),
    );
  }
}
