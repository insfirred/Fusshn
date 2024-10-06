import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_loading_btn.dart';

import '../../common_widgets/fusshn_btn.dart';
import '../auth_view_model.dart';
import 'text_field_auth.dart';

class LoginSection extends ConsumerStatefulWidget {
  const LoginSection({super.key});

  @override
  ConsumerState<LoginSection> createState() => LoginSectionState();
}

class LoginSectionState extends ConsumerState<LoginSection> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailController.addListener(
      () {
        ref.read(authViewModelProvider.notifier).setEmail(emailController.text);
      },
    );

    passwordController.addListener(
      () {
        ref
            .read(authViewModelProvider.notifier)
            .setPassword(passwordController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final showPassword = ref.watch(
      authViewModelProvider.select((_) => _.showPassword),
    );

    final emailError = ref.watch(
      authViewModelProvider.select((_) => _.emailError),
    );

    final passwordError = ref.watch(
      authViewModelProvider.select((_) => _.passwordError),
    );

    final status = ref.watch(
      authViewModelProvider.select((_) => _.status),
    );

    return Container(
      // TODO: Remove this margin in future
      margin: const EdgeInsets.only(top: 160),
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
              'Sign in',
              style: Theme.of(context).textTheme.titleMedium,
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
            TextFieldAuth(
              hintText: 'Password',
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              errorMessage: passwordError,
              prefixIcon: Image.asset(
                'assets/password.png',
                width: 16,
                height: 16,
              ),
              obscure: !showPassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  ref
                      .read(authViewModelProvider.notifier)
                      .setShowPassword(!showPassword);
                },
                behavior: HitTestBehavior.opaque,
                child: Image.asset(
                  showPassword
                      ? 'assets/eye_open.png'
                      : 'assets/eye_closed.png',
                  width: 20,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Email or Password?',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF01FFFF),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            status == AuthViewStatus.loading
                ? const FusshnLoadingBtn(height: 53)
                : FusshnBtn(
                    height: 53,
                    label: 'Submit',
                    onTap: () {
                      ref.read(authViewModelProvider.notifier).login();
                    },
                  ),
            const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     ref.read(preferenceServiceProvider).setBool(isFreshKey, true);
            //   },
            //   child: Text('del'),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?  ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFFB3B3B3),
                      ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(authViewModelProvider.notifier)
                          .setAuthViewScreen(AuthViewType.register);
                    },
                    child: Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF9BFFB1),
                          ),
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
