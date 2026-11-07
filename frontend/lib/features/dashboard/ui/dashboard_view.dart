import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/network/api_client.dart';
import '../data/dashboard_repository.dart';
import 'dashboard_view_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late final http.Client _client;
  late final DashboardViewModel _model;

  @override
  void initState() {
    super.initState();
    _client = http.Client();
    _model = DashboardViewModel(DashboardRepository(ApiClient(_client)));
    _model.load();
  }

  @override
  void dispose() {
    _model.dispose();
    _client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _model,
      builder: (context, child) {
        if (_model.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (_model.error case final error?) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(error, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _model.load,
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            ),
          );
        }
        final data = _model.data;
        if (data == null) return const SizedBox.shrink();
        final metrics = [
          ('Materias activas', '${data.subjectCount}', Icons.menu_book),
          ('Promedio general', data.average.toStringAsFixed(1), Icons.school),
          ('Asistencia', '${data.attendance}%', Icons.event_available),
          ('Tareas pendientes', '${data.pendingTasks}', Icons.checklist),
          ('Préstamos activos', '${data.activeLoans}', Icons.computer),
          ('Archivos', '${data.fileCount}', Icons.folder_open),
        ];
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Tu actividad académica',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text('Datos de demostración tomados del prototipo HTML.'),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 1000
                    ? 3
                    : constraints.maxWidth >= 560
                    ? 2
                    : 1;
                final width =
                    (constraints.maxWidth - 16 * (columns - 1)) / columns;
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: metrics
                      .map(
                        (metric) => SizedBox(
                          width: width,
                          child: Card(
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Icon(
                                    metric.$3,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(metric.$1),
                                        Text(
                                          metric.$2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
            const SizedBox(height: 24),
            Text('Mis materias', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            ...data.subjects.map(
              (subject) => Card(
                child: ListTile(
                  leading: const Icon(Icons.menu_book_outlined),
                  title: Text(subject),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
