import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sale_model.dart';

abstract class SaleRemoteDataSource {
  Future<List<SaleModel>> fetchSales({
    required String token,
    required int userId,
    required String companyId,
    int pageNo = 1,
    int itemsPerPage = 10,
    String? searchQuery,
  });
}

class SaleRemoteDataSourceImpl implements SaleRemoteDataSource {
  final String baseUrl =
      'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';

  @override
  Future<List<SaleModel>> fetchSales({
    required String token,
    required int userId,
    required String companyId,
    int pageNo = 1,
    int itemsPerPage = 10,
    String? searchQuery,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "BranchID": 1,
        "CompanyID": companyId,
        "CreatedUserID": userId,
        "PriceRounding": 2,
        "page_no": pageNo,
        "items_per_page": itemsPerPage,
        "type": "Sales",
        "WarehouseID": 1,
        if (searchQuery != null && searchQuery.isNotEmpty)
          "search": searchQuery,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      // Handle both int and String success codes
      final success = jsonResponse['success'];
      if (success == 6000 || success == "6000") {
        final rawData = jsonResponse['data'];
        List dataList = [];

        if (rawData is List) {
          dataList = rawData;
        } else if (rawData is Map) {
          // Try to find the list in common nested locations
          if (rawData['data'] is List) {
            dataList = rawData['data'];
          } else if (rawData['data'] is Map && rawData['data']['data'] is List) {
            dataList = rawData['data']['data'];
          } else if (rawData.containsKey('data') && rawData['data'] is List) {
             dataList = rawData['data'];
          }
        }

        return dataList.map((item) => SaleModel.fromJson(item)).toList();
      } else {
        final msg = jsonResponse['message'] ?? 'Failed to fetch sales';
        throw Exception('$msg (Code: $success)');
      }
    } else {
      throw Exception('Server Error: ${response.statusCode}');
    }
  }
}

 