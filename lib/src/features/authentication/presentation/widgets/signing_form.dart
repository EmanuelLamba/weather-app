import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../utils/colors.dart' as colors;
import '../../../../utils/sizes.dart' as sizes;
import '../../domain/auth_controller.dart';
import '../../domain/form_controller.dart';
import 'custom_form_field.dart';

class SigningForm extends StatelessWidget {
  const SigningForm({
    required this.sendButtonText,
    required this.isSingIn,
    super.key,
  });

  final String sendButtonText;
  final bool isSingIn;

  @override
  Widget build(final BuildContext context) {
    final AuthController authController = Provider.of<AuthController>(context);
    final FormController formController = Provider.of<FormController>(context);
    final MyFormState formState = formController.state;

    Future<void> validateForm() async {
      final bool isValidForm = formController.validateForm(context);
      FocusManager.instance.primaryFocus?.unfocus();
      if (isValidForm && isSingIn) {
        await authController.signInUser(
          context,
          formState.email!.value!,
          formState.password!.value!,
        );
        return;
      }
      if (isValidForm && !isSingIn) {
        await authController.createUser(
          context,
          formState.email!.value!,
          formState.password!.value!,
        );
        return;
      }
    }

    return Form(
      child: Column(
        children: <Widget>[
          CustomFormField(
            hintText: 'Enter your email...',
            isPassword: false,
            onChanged: formController.onEmailChange,
            errorText: formState.email!.error,
            borderColor: getBorderColor(formState.email!),
          ),
          const SizedBox(height: sizes.formDelimiter),
          CustomFormField(
            hintText: 'Enter your password...',
            isPassword: true,
            onChanged: formController.onPasswordChange,
            errorText: formState.password!.error,
            borderColor: getBorderColor(formState.password!),
          ),
          const SizedBox(height: sizes.formDelimiter),
          CustomButton(text: sendButtonText, onPressed: validateForm),
        ],
      ),
    );
  }

  Color? getBorderColor(final FieldItem field) {
    if (field.error != null && field.value == null) {
      return colors.errorColor;
    }
    if (field.value != null && field.error == null) {
      return colors.detailColor;
    }
    return null;
  }
}
