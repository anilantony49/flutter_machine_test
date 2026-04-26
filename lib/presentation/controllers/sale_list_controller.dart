import 'package:flutter/material.dart';
import '../../domain/entities/sale.dart';
import '../../domain/usecases/get_sales_usecase.dart';

class SaleListController extends ChangeNotifier {
  final GetSalesUseCase getSalesUseCase;

  SaleListController({required this.getSalesUseCase});

  List<Sale> _sales = [];
  List<Sale> get sales => _sales;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  Future<void> fetchSales({String? query}) async {
    _isLoading = true;
    _errorMessage = null;
    if (query != null) {
      _searchQuery = query;
    }
    notifyListeners();

    try {
      _sales = await getSalesUseCase(searchQuery: _searchQuery);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
    }
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    fetchSales(query: query);
  }
}
