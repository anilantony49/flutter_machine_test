import '../entities/sale.dart';
import '../repositories/sale_repository.dart';

class GetSalesUseCase {
  final SaleRepository repository;

  GetSalesUseCase(this.repository);

  Future<List<Sale>> call({int pageNo = 1, String? searchQuery}) async {
    return await repository.getSales(pageNo: pageNo, searchQuery: searchQuery);
  }
}
