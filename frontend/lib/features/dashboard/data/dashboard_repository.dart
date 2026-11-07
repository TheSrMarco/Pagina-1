import '../../../core/network/api_client.dart';
import '../domain/dashboard_data.dart';

class DashboardRepository {
  DashboardRepository(this._api);

  final ApiClient _api;

  Future<DashboardData> loadDemo() async {
    return DashboardData.fromJson(await _api.get('demo/dashboard/'));
  }
}
