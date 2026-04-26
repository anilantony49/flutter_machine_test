import '../entities/sale.dart';

abstract class SaleRepository {
  Future<List<Sale>> getSales({
    int pageNo = 1,
    String? searchQuery,
  });
}
