import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../common_widgets/fusshn_appbar.dart';
import '../home_tab/components/give_feedback_card.dart';

@RoutePage()
class SendFeedbackView extends StatelessWidget {
  const SendFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          FusshnAppBar(label: 'Share Feedback'),
          Column(
            children: [
              SizedBox(height: 100),
              GiveFeedbackCard(showBackBtn: false),
            ],
          ),
        ],
      ),
    );
  }
}
