import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/utils/snackbar_utils.dart';

import '../../common/dimens.dart';
import '../common_widgets/fusshn_appbar.dart';
import '../common_widgets/fusshn_btn.dart';
import 'edit_profile_view_model.dart';

@RoutePage()
class EditProfileView extends ConsumerWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMsg = ref.watch(
          editProfileViewModelProvider.select((_) => _.errorMessage),
        ) ??
        'Something went wrong';

    ref.listen(
      editProfileViewModelProvider,
      (prev, next) {
        if (next.status == EditProfileViewStatus.success) {
          context.maybePop();
          showSuccessMessage(context, 'Your changes have been saved');
        }

        if (next.status == EditProfileViewStatus.error) {
          showErrorMessage(context, errorMsg);
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: homeTabHorizontalPadding),
          child: Column(
            children: [
              const FusshnAppBar(label: 'Edit Profile'),
              const SizedBox(height: 50),
              Container(
                height: 80,
                width: 90,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // context.navigateTo(const EditProfileRoute());
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Text(
                      'Change Profile Picture',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: const Color(0xFFC395FF),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const _AllFields(),
              const SizedBox(height: 80),
              FusshnBtn(
                label: 'Save Details',
                onTap: () {
                  ref
                      .read(editProfileViewModelProvider.notifier)
                      .saveDetailsPressed();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AllFields extends ConsumerStatefulWidget {
  const _AllFields();

  @override
  ConsumerState<_AllFields> createState() => _AllFieldsState();
}

class _AllFieldsState extends ConsumerState<_AllFields> {
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

    return Column(
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