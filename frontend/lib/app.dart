import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/ui/registration_preview.dart';
import 'features/shell/ui/app_shell.dart';

class PiuttecApp extends StatelessWidget {
  const PiuttecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIUTTEC 2.0',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const _DemoEntryGate(),
    );
  }
}

class _DemoEntryGate extends StatefulWidget {
  const _DemoEntryGate();

  @override
  State<_DemoEntryGate> createState() => _DemoEntryGateState();
}

class _DemoEntryGateState extends State<_DemoEntryGate> {
  bool _entered = false;

  @override
  Widget build(BuildContext context) {
    if (_entered) return const AppShell();
    return RegistrationPreview(
      onContinue: () => setState(() => _entered = true),
    );
  }
}
