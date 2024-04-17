import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_view_model.dart';
import 'text_field_auth.dart';

class RegisterSection extends ConsumerStatefulWidget {
  const RegisterSection({super.key});

  @override
  ConsumerState<RegisterSection> createState() => RegisterSectionState();
}

class RegisterSectionState extends ConsumerState<RegisterSection> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();

    nameController.addListener(
      () {
        ref.read(authViewModelProvider.notifier).setName(nameController.text);
      },
    );

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

    confirmPasswordController.addListener(
      () {
        ref
            .read(authViewModelProvider.notifier)
            .setConfirmPassword(confirmPasswordController.text);
      },
    );

    phoneController.addListener(
      () {
        ref.read(authViewModelProvider.notifier).setPhone(phoneController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final showPassword = ref.watch(
      authViewModelProvider.select((_) => _.showPassword),
    );

    final showConfirmPassword = ref.watch(
      authViewModelProvider.select((_) => _.showConfirmPassword),
    );

    final nameError = ref.watch(
      authViewModelProvider.select((_) => _.nameError),
    );

    final emailError = ref.watch(
      authViewModelProvider.select((_) => _.emailError),
    );

    final passwordError = ref.watch(
      authViewModelProvider.select((_) => _.passwordError),
    );

    final confirmPasswordError = ref.watch(
      authViewModelProvider.select((_) => _.confirmPasswordError),
    );

    final mobileError = ref.watch(
      authViewModelProvider.select((_) => _.mobileError),
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 175),
          TextFieldAuth(
            hintText: 'Full name',
            controller: nameController,
            keyboardType: TextInputType.name,
            errorMessage: nameError,
          ),
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
          TextFieldAuth(
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            errorMessage: confirmPasswordError,
            obscure: !showConfirmPassword,
            suffixIcon: GestureDetector(
              onTap: () {
                ref
                    .read(authViewModelProvider.notifier)
                    .setShowConfirmPassword(!showConfirmPassword);
              },
              behavior: HitTestBehavior.opaque,
              child: Image.asset(
                showConfirmPassword
                    ? 'assets/eye_open.png'
                    : 'assets/eye_closed.png',
                color: Colors.black,
                width: 25,
              ),
            ),
          ),
          TextFieldAuth(
            hintText: 'Phone Number',
            controller: phoneController,
            keyboardType: TextInputType.phone,
            maxCharaters: 10,
            errorMessage: mobileError,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              ref.read(authViewModelProvider.notifier).register();
            },
            child: const Text('Register'),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(authViewModelProvider.notifier)
                  .setAuthViewScreen(AuthViewType.login);
            },
            child: const Text('Already have an account'),
          ),
        ],
      ),
    );
  }
}
