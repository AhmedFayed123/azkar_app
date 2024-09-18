import 'package:flutter/material.dart';
import 'package:task3/features/settings/presentation/widgets/settings_body.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsBody(),
    );
  }
}
