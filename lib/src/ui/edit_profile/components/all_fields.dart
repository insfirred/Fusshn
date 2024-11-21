import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/app_repository.dart';
import '../edit_profile_view_model.dart';

class AllFields extends ConsumerStatefulWidget {
  const AllFields({super.key});

  @override
  ConsumerState<AllFields> createState() => AllFieldsState();
}

class AllFieldsState extends ConsumerState<AllFields> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
        text: ref.read(editProfileViewModelProvider).name);
    emailController = TextEditingController(
        text: ref.read(editProfileViewModelProvider).email);
    phoneController = TextEditingController(
        text: ref.read(editProfileViewModelProvider).mobile);

    nameController.addListener(
      () {
        ref
            .read(editProfileViewModelProvider.notifier)
            .setName(nameController.text);
      },
    );

    phoneController.addListener(
      () {
        ref
            .read(editProfileViewModelProvider.notifier)
            .setPhone(phoneController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameError = ref.watch(
      editProfileViewModelProvider.select((_) => _.nameError),
    );
    final mobileError = ref.watch(
      editProfileViewModelProvider.select((_) => _.mobileError),
    );

    final isEmailVerified = ref
            .read(appRepositoryProvider.notifier)
            .getCurrentUser()
            ?.emailVerified ??
        false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TextField(
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
        _TextField(
          hintText: 'Phone Number',
          controller: phoneController,
          keyboardType: TextInputType.phone,
          errorMessage: mobileError,
          prefixIcon: Image.asset(
            'assets/mobile.png',
            width: 16,
            height: 16,
          ),
        ),
        _TextField(
          controller: emailController,
          prefixIcon: Image.asset(
            'assets/email.png',
            width: 16,
            height: 16,
            color: const Color(0xFF808080),
          ),
          suffixIcon: Image.asset(
            'assets/lock.png',
            width: 16,
            height: 16,
            color: const Color(0xFF808080),
          ),
          readOnly: true,
          textColor: const Color(0xFF808080),
        ),
        if (!isEmailVerified) ...[
          //   TextButton(
          //     onPressed: () {
          //       showModalBottomSheet(
          //         context: context,
          //         builder: (context) => const EmailVerificationSheet(),
          //       );
          //     },
          //     child: const Text('Click to verify your email'),
          //   ),
          //   TextButton(
          //     onPressed: () async {
          //       User? currentUser =
          //           ref.read(appRepositoryProvider.notifier).getCurrentUser();

          //       await currentUser?.reload();
          //       currentUser =
          //           ref.read(appRepositoryProvider.notifier).getCurrentUser();
          //       if (currentUser?.emailVerified == true) {
          //         ref
          //             .read(appRepositoryProvider.notifier)
          //             .setEmailVerifiedInFirestore();
          //       }
          //       log('User reloaded ${currentUser?.emailVerified}');
          //     },
          //     child: const Text('Check email verified or not'),
          //   ),
        ],
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    this.hintText = '',
    this.controller,
    this.keyboardType,
    this.errorMessage,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.textColor,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? errorMessage;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF404040).withOpacity(0.5),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: keyboardType,
        style:
            Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: const Color(0xFFFFFFFF).withOpacity(0.6)),
          errorText: errorMessage,
          suffixIconConstraints: const BoxConstraints(
            minHeight: 15,
            minWidth: 15,
          ),
        ),
      ),
    );
  }
}
