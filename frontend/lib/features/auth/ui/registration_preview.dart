import 'package:flutter/material.dart';

import '../../privacy/ui/privacy_notice_view.dart';

class RegistrationPreview extends StatefulWidget {
  const RegistrationPreview({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  State<RegistrationPreview> createState() => _RegistrationPreviewState();
}

class _RegistrationPreviewState extends State<RegistrationPreview> {
  bool _noticeRead = false;
  bool _optionalPurposes = false;

  void _openFullNotice() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Aviso de privacidad integral')),
          body: const PrivacyNoticeView(),
        ),
      ),
    );
  }

  void _registerDemo() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Registro de demostración: no se enviaron ni guardaron datos.',
        ),
      ),
    );
    widget.onContinue();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PIUTTEC 2.0'),
        actions: [
          TextButton.icon(
            onPressed: widget.onContinue,
            icon: const Icon(Icons.visibility_outlined),
            label: const Text('Ver demostración'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Crear cuenta institucional',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pantalla demostrativa. No ingreses información real.',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Card(
                    color: colors.primaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.privacy_tip_outlined,
                                color: colors.onPrimaryContainer,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Aviso de privacidad simplificado',
                                  style: textTheme.titleLarge?.copyWith(
                                    color: colors.onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'La Universidad Tecnológica de Tecámac (UTTEC) '
                            'es la institución prevista para operar PIUTTEC '
                            '2.0. Los datos de identificación y académicos '
                            'se utilizarían para crear la cuenta, prestar '
                            'servicios escolares y gestionar trámites. Esta '
                            'demostración no envía ni conserva los datos que '
                            'escribas en este formulario.',
                            style: TextStyle(color: colors.onPrimaryContainer),
                          ),
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: _openFullNotice,
                            icon: const Icon(Icons.open_in_new),
                            label: const Text('Leer aviso integral'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Datos de registro',
                            style: textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Usa únicamente datos ficticios para probar la interfaz.',
                            style: textTheme.bodySmall,
                          ),
                          const SizedBox(height: 20),
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Nombre completo (ficticio)',
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Correo institucional de prueba',
                              prefixIcon: Icon(Icons.alternate_email),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Matrícula de prueba',
                              prefixIcon: Icon(Icons.badge_outlined),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Contraseña de prueba',
                              prefixIcon: Icon(Icons.lock_outline),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            value: _noticeRead,
                            onChanged: (value) {
                              setState(() => _noticeRead = value ?? false);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text(
                              'Confirmo que pude consultar el aviso de privacidad.',
                            ),
                          ),
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            value: _optionalPurposes,
                            onChanged: (value) {
                              setState(
                                () => _optionalPurposes = value ?? false,
                              );
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text(
                              'Deseo recibir avisos opcionales, encuestas y tutorías.',
                            ),
                            subtitle: const Text(
                              'Opcional y separado del registro académico.',
                            ),
                          ),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: _noticeRead ? _registerDemo : null,
                            icon: const Icon(Icons.person_add_alt_1),
                            label: const Text('Registrarme (demostración)'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
