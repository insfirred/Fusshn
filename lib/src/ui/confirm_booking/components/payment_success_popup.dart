import 'package:flutter/material.dart';

class PaymentSuccessPopup extends StatefulWidget {
  const PaymentSuccessPopup({super.key});

  @override
  State<PaymentSuccessPopup> createState() => _PaymentSuccessPopupState();
}

class _PaymentSuccessPopupState extends State<PaymentSuccessPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation when the view is opened
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _offsetAnimation,
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.symmetric(
              horizontal: 64,
              vertical: 45,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: const Color(0xFFF1F1F1)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Complete your profile',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 41),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _AccountTypeBtn(
                      label: 'User',
                      onTap: () {
                        // GoRouter.of(context).go('/create-user-profile');
                      },
                    ),
                    _AccountTypeBtn(
                      label: 'Influencer',
                      onTap: () {
                        // GoRouter.of(context).go('/create-influencer-profile');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFF1F1F1))),
                    const SizedBox(width: 8),
                    Text(
                      'OR',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(child: Divider(color: Color(0xFFF1F1F1))),
                  ],
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Register as a ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 20),
                      ),
                      TextSpan(
                        text: 'Brand',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 20,
                              color: const Color(0xFF4776E6),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AccountTypeBtn extends StatefulWidget {
  const _AccountTypeBtn({
    required this.label,
    required this.onTap,
  });

  final String label;
  final void Function() onTap;

  @override
  State<_AccountTypeBtn> createState() => _AccountTypeBtnState();
}

class _AccountTypeBtnState extends State<_AccountTypeBtn> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        isHover = true;
        setState(() {});
      },
      onExit: (event) {
        isHover = false;
        setState(() {});
      },
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: 125,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: isHover ? const Color(0xFFF1F1F1) : null,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFF1F1F1)),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    color: isHover
                        ? const Color(0xFF111111)
                        : const Color(0xFFF1F1F1),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
