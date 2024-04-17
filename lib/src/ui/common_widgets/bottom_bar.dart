import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({
    super.key,
  });

  static final height = Platform.isIOS ? 80.0 : 60.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: BottomBar.height,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 7,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 18,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavigationBarItem(
                label: 'Home',
                isActive: context.tabsRouter.activeIndex == 0,
                onTap: () {
                  // ref.read(homeTabModelProvider.notifier).refreshData();
                  _onTapTab(context, 0);
                },
              ),
              _NavigationBarItem(
                label: 'Events',
                isActive: context.tabsRouter.activeIndex == 1,
                onTap: () => _onTapTab(context, 1),
              ),
              _NavigationBarItem(
                label: 'Venue',
                isActive: context.tabsRouter.activeIndex == 2,
                onTap: () => _onTapTab(context, 2),
              ),
              _NavigationBarItem(
                label: 'Profile',
                isActive: context.tabsRouter.activeIndex == 3,
                onTap: () => _onTapTab(context, 3),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onTapTab(BuildContext context, int index) {
    FocusScope.of(context).unfocus();
    context.tabsRouter.setActiveIndex(index);
  }
}

class _NavigationBarItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavigationBarItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = isActive
        ? 'assets/${label.toLowerCase()}_tab_selected.png'
        : 'assets/${label.toLowerCase()}_tab_unselected.png';

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                width: 30,
              ),
              const SizedBox(height: 4),
              Text(
                label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
