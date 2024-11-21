import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/dimens.dart';
import '../../utils/snackbar_utils.dart';
import '../common_widgets/fusshn_appbar.dart';
import '../common_widgets/fusshn_btn.dart';
import 'components/all_fields.dart';
import 'components/edit_image_section.dart';
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
              const EditImageSection(),
              const SizedBox(height: 30),
              const AllFields(),
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
