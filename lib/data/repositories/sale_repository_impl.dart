import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/sale.dart';
import '../../domain/repositories/sale_repository.dart';
import '../datasources/sale_remote_data_source.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleRemoteDataSource remoteDataSource;

  SaleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Sale>> getSales({
    int pageNo = 1,
    String? searchQuery,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final userId = prefs.getInt('user_id') ?? 0;
    final companyId = prefs.getString('company_id') ?? '1901b825-fe6f-418d-b5f0-7223d0040d08';

    return await remoteDataSource.fetchSales(
      token: token,
      userId: userId,
      companyId: companyId,
      pageNo: pageNo,
      searchQuery: searchQuery,
    );
  }
}
