import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
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
      home: const AppShell(),
    );
  }
}
