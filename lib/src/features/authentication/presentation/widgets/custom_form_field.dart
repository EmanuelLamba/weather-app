// ignore_for_file: avoid_bool_literals_in_conditional_expressions,
// ignore_for_file: avoid_dynamic_calls,

import 'package:flutter/material.dart';
import '../../../../common_widgets/decorated_input_border.dart';
import '../../../../utils/colors.dart' as colors;

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    required this.hintText,
    required this.isPassword,
    required this.onChanged,
    this.errorText,
    this.borderColor,
    super.key,
  });

  final String hintText;
  final bool isPassword;
  final String? errorText;
  final Function onChanged;
  final Color? borderColor;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late final TextEditingController controller;
  late bool isNotVisible = true;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: controller,
      onChanged: (final String value) {
        widget.onChanged(value);
      },
      obscureText: widget.isPassword ? isNotVisible : false,
      decoration: InputDecoration(
        contentPadding: widget.isPassword
            ? const EdgeInsets.fromLTRB(26, 16, 8, 16)
            : const EdgeInsets.fromLTRB(26, 16, 26, 16),
        hintText: widget.hintText,
        errorText: widget.errorText,
        suffixIcon: widget.isPassword
            ? IconButton(
                padding: const EdgeInsets.only(right: 14),
                splashRadius: 1,
                color: colors.detailColor,
                onPressed: () {
                  setState(() {
                    isNotVisible = !isNotVisible;
                  });
                },
                icon: isNotVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,
        border: widget.borderColor == null
            ? null
            : DecoratedInputBorder(
                shadow: BoxShadow(
                  color: widget.borderColor!,
                  blurRadius: 10,
                  spreadRadius: -2,
                ),
                child: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
      ),
    );
  }
}
