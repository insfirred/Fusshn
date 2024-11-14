import 'package:flutter/material.dart';

import 'profile_item.dart';

class HelpDropDown extends StatelessWidget {
  const HelpDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 12),
      child: Column(
        children: [
          ProfileItem(
            title: 'Contact Us',
          ),
          ProfileItem(
            title: 'Send Feedback',
          ),
        ],
      ),
    );
  }
}
