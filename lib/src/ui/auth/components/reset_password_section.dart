import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/fusshn_btn.dart';
import '../../common_widgets/fusshn_loading_btn.dart';
import '../auth_view_model.dart';
import 'text_field_auth.dart';

class ResetPasswordSection extends ConsumerStatefulWidget {
  const ResetPasswordSection({super.key});

  @override
  ConsumerState<ResetPasswordSection> createState() =>
      ResetPasswordSectionState();
}

class ResetPasswordSectionState extends ConsumerState<ResetPasswordSection> {
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController.addListener(
      () {
        ref.read(authViewModelProvider.notifier).setEmail(emailController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final emailError = ref.watch(
      authViewModelProvider.select((_) => _.emailError),
    );

    final status = ref.watch(
      authViewModelProvider.select((_) => _.status),
    );

    return Container(
      margin: const EdgeInsets.only(top: 230),
      decoration: BoxDecoration(
        color: const Color(0xFF707070).withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset password',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'A reset link will be sent to your email address, click on that link to reset your password.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey.shade400),
            ),
            const SizedBox(height: 16),
            TextFieldAuth(
              hintText: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              errorMessage: emailError,
              prefixIcon: Image.asset(
                'assets/email.png',
                width: 16,
                height: 16,
              ),
            ),
            const SizedBox(height: 12),
            status == AuthViewStatus.loading
                ? const FusshnLoadingBtn(height: 53)
                : FusshnBtn(
                    height: 53,
                    label: 'Send Reset link',
                    onTap: () async {
                      bool doesLinkSent = await ref
                          .read(authViewModelProvider.notifier)
                          .resetPassword();

                      if (doesLinkSent) {
                        ref
                            .read(authViewModelProvider.notifier)
                            .setAuthViewScreen(AuthViewType.login);

                        // it ensures that alert will show up on login section
                        ref
                            .read(authViewModelProvider.notifier)
                            .setResetPasswordLinkSentAlert(true);
                      }
                    },
                  ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    ref
                        .read(authViewModelProvider.notifier)
                        .setAuthViewScreen(AuthViewType.login);
                  },
                  child: Text(
                    'Back to login',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF01FFFF),
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
