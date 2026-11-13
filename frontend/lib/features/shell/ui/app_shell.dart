import 'package:flutter/material.dart';

import '../../dashboard/ui/dashboard_view.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selected = 0;
  static const _sections = [
    ('Panel Principal', Icons.dashboard_outlined),
    ('Mis Materias', Icons.menu_book_outlined),
    ('Control de Asistencias', Icons.event_available_outlined),
    ('Gestor de Archivos', Icons.folder_open_outlined),
    ('Salones y Equipos', Icons.computer_outlined),
    ('Agenda y Tareas', Icons.checklist_outlined),
    ('Refuerzo Académico', Icons.psychology_outlined),
    ('Directorio y Promedio', Icons.calculate_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 1024;
    final navigation = SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Icon(Icons.school, size: 36),
                SizedBox(height: 8),
                Text(
                  'PIUTTEC 2.0',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('Desarrollo local'),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _sections.length,
              itemBuilder: (context, index) => ListTile(
                selected: _selected == index,
                leading: Icon(_sections[index].$2),
                title: Text(_sections[index].$1),
                onTap: () {
                  setState(() => _selected = index);
                  if (!wide) Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text(_sections[_selected].$1)),
      drawer: wide ? null : Drawer(child: navigation),
      body: Row(
        children: [
          if (wide) SizedBox(width: 280, child: navigation),
          if (wide) const VerticalDivider(width: 1),
          Expanded(
            child: IndexedStack(
              index: _selected,
              children: [
                const DashboardView(),
                ..._sections
                    .skip(1)
                    .map(
                      (section) => Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(section.$2, size: 48),
                              const SizedBox(height: 16),
                              Text(
                                section.$1,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'En desarrollo',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
