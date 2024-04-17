import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 200),
          TextFieldAuth(
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            errorMessage: emailError,
          ),
          TextFieldAuth(
            hintText: 'Password',
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            errorMessage: passwordError,
            obscure: !showPassword,
            suffixIcon: GestureDetector(
              onTap: () {
                ref
                    .read(authViewModelProvider.notifier)
                    .setShowPassword(!showPassword);
              },
              behavior: HitTestBehavior.opaque,
              child: Image.asset(
                showPassword ? 'assets/eye_open.png' : 'assets/eye_closed.png',
                color: Colors.black,
                width: 25,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              ref.read(authViewModelProvider.notifier).login();
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(authViewModelProvider.notifier)
                  .setAuthViewScreen(AuthViewType.register);
            },
            child: const Text('New to Fusshn, Create an account'),
          ),
        ],
      ),
    );
  }
}
