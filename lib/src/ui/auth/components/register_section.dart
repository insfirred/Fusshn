import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_btn.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_loading_btn.dart';

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

    final status = ref.watch(
      authViewModelProvider.select((_) => _.status),
    );

    return Container(
      margin: const EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
        color: const Color(0xFF707070).withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please fill your details',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 18),
            TextFieldAuth(
              hintText: 'Full name',
              controller: nameController,
              keyboardType: TextInputType.name,
              errorMessage: nameError,
              prefixIcon: Image.asset(
                'assets/person.png',
                width: 16,
                height: 16,
              ),
            ),
            TextFieldAuth(
              hintText: 'Phone Number',
              controller: phoneController,
              keyboardType: TextInputType.phone,
              errorMessage: mobileError,
              prefixIcon: Image.asset(
                'assets/mobile.png',
                width: 16,
                height: 16,
              ),
              maxLength: 10,
            ),
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
            TextFieldAuth(
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              errorMessage: confirmPasswordError,
              prefixIcon: Image.asset(
                'assets/password.png',
                width: 16,
                height: 16,
              ),
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
                  width: 20,
                ),
              ),
            ),
            const SizedBox(height: 18),
            const _TermsConditions(),
            const SizedBox(height: 16),
            status == AuthViewStatus.loading
                ? const FusshnLoadingBtn(height: 53)
                : FusshnBtn(
                    height: 53,
                    label: 'Register',
                    onTap: () {
                      ref.read(authViewModelProvider.notifier).register();
                    },
                  ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?  ',
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
                          .setAuthViewScreen(AuthViewType.login);
                    },
                    child: Text(
                      'Sign in',
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

class _TermsConditions extends ConsumerWidget {
  const _TermsConditions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTermsAccepted = ref.watch(
      authViewModelProvider.select((_) => _.isTermsAccepted),
    );

    return Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: isTermsAccepted,
          onChanged: (val) {
            ref
                .read(authViewModelProvider.notifier)
                .setIsTermsAccepted(!isTermsAccepted);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        Expanded(
          child: Text(
            'I accept the above terms & conditions & promise to comply with future chnages',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                ),
          ),
        ),
      ],
    );
  }
}
