import 'package:flutter/material.dart';

import '../utils/sizes.dart' as sizes;

class CustomDelimiter extends StatelessWidget {
  const CustomDelimiter({super.key, this.size = 10});

  final double size;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height / sizes.defaultDelimiter + size,
    );
  }
}
