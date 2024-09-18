import 'package:flutter/material.dart';
import 'package:task3/features/azkar/presentation/widgets/adhkar_screen_body.dart';

class AdhkarScreen extends StatelessWidget {
  const AdhkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'الأذكار',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: const AdhkarScreenBody(),
    );
  }
}
