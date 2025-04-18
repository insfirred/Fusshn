import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/routing/app_router.dart';
import 'package:lottie/lottie.dart';

import '../../common_widgets/fusshn_btn.dart';

Widget paymentSuccessAlert(BuildContext context) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3.5,
        sigmaY: 3.5,
      ),
      child: AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Center(
          child: Column(
            children: [
              Lottie.asset(
                'assets/lottie/payment_success.json',
              ),
              const SizedBox(height: 10),
              const Text(
                'Yayy!!',
              ),
            ],
          ),
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your booking is successful",
            ),
          ],
        ),
        contentTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF78F894).withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
        contentPadding: const EdgeInsets.only(top: 15, bottom: 17),
        actions: [
          FusshnBtn(
            height: 40,
            width: 180,
            onTap: () {
              context.maybePop();
              context.navigateTo(const BookingHistoryRoute());
            },
            label: 'View bookings',
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
