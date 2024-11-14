// logout popup
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/app_repository.dart';

logoutAlert(BuildContext context, WidgetRef ref) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3.5,
        sigmaY: 3.5,
      ),
      child: AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Column(
          children: [
            Image.asset('assets/gifs/delete_account.png'),
            const Padding(
              padding: EdgeInsets.only(left: 24, bottom: 24, right: 24),
              child: Text(
                'Are You really want to logout from this device?',
              ),
            ),
          ],
        ),
        titlePadding: const EdgeInsets.all(0),
        titleTextStyle: Theme.of(context).textTheme.bodyMedium,
        actions: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFF9BFFB1),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'No',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: const Color.fromARGB(255, 48, 185, 77),
                    child: InkWell(
                      onTap: () {
                        ref.read(appRepositoryProvider.notifier).logout();
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
