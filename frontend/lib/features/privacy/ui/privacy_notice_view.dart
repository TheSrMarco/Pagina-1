import 'package:flutter/material.dart';

class PrivacyNoticeView extends StatelessWidget {
  const PrivacyNoticeView({super.key});

  static const _sections = [
    (
      'Institución y contacto',
      'La Universidad Tecnológica de Tecámac (UTTEC) es la institución '
          'prevista para operar PIUTTEC 2.0. Su domicilio es carretera '
          'federal México–Pachuca, km 37.5, predio Sierra Hermosa, C.P. 55740, '
          'Tecámac, Estado de México. Teléfono general: 55 5938 8400.',
    ),
    (
      'Datos y finalidades',
      'La aplicación de prueba utiliza datos de ejemplo. El uso institucional '
          'previsto comprende la consulta de materias, calificaciones y '
          'asistencias, la organización de la agenda, la gestión de archivos '
          'y solicitudes de recursos, y el refuerzo académico. Utilice datos '
          'ficticios al probar la aplicación.',
    ),
    (
      'Finalidades opcionales',
      'Los avisos no obligatorios, las encuestas y las tutorías son '
          'finalidades adicionales previstas para la versión institucional.',
    ),
    (
      'Derechos ARCO',
      'Para consultar cómo ejercer los derechos de acceso, rectificación, '
          'cancelación y oposición, comuníquese con la Unidad de '
          'Transparencia de la UTTEC en dpl@uttecamac.edu.mx.',
    ),
    (
      'Condiciones pendientes de validación',
      'La UTTEC deberá validar el fundamento aplicable a PIUTTEC 2.0, '
          'las condiciones de tratamiento y transferencia, los plazos de '
          'conservación, el horario de atención y el órgano garante.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SelectionArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Borrador para demostración',
                        style: textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Versión 1.0 · 12 de noviembre de 2026',
                        style: textTheme.bodySmall,
                      ),
                      for (final (title, body) in _sections) ...[
                        const SizedBox(height: 20),
                        Semantics(
                          header: true,
                          child: Text(title, style: textTheme.titleMedium),
                        ),
                        const SizedBox(height: 6),
                        Text(body, style: textTheme.bodyMedium),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
