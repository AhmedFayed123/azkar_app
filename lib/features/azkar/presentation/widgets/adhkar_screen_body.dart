import 'package:flutter/material.dart';

import 'adhkar_list.dart';

class AdhkarScreenBody extends StatelessWidget {
  const AdhkarScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: AdhkarList(),
        ),
      ),
    );
  }
}
