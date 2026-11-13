import 'package:flutter/foundation.dart';

import '../data/dashboard_repository.dart';
import '../domain/dashboard_data.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel(this._repository);

  final DashboardRepository _repository;
  DashboardData? data;
  bool loading = false;
  String? error;
  bool _disposed = false;

  Future<void> load() async {
    if (_disposed || loading) return;
    loading = true;
    error = null;
    notifyListeners();
    try {
      final result = await _repository.loadDemo();
      if (_disposed) return;
      data = result;
    } catch (_) {
      if (_disposed) return;
      error = 'No pudimos cargar el panel. Comprueba que la API local esté encendida.';
    } finally {
      if (!_disposed) {
        loading = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
