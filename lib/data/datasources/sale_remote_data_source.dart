import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sale_model.dart';

abstract class SaleRemoteDataSource {
  Future<List<SaleModel>> fetchSales({
    required String token,
    required int userId,
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
        "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
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
      if (jsonResponse['success'] == 6000) {
        final List data = jsonResponse['data'] ?? [];

        return data.map((item) => SaleModel.fromJson(item)).toList();
      } else {

        throw Exception(jsonResponse['message'] ?? 'Failed to fetch sales');
      }
    } else {
      throw Exception('Server Error: ${response.statusCode}');
    }
  }
}

// class SaleRemoteDataSourceImpl implements SaleRemoteDataSource {
//   final String baseUrl =
//       'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';

//   @override
//   Future<List<SaleModel>> fetchSales({
//     required String token,
//     required int userId,
//     int pageNo = 1,
//     int itemsPerPage = 10,
//     String? searchQuery,
//   }) async {
//     final body = {
//       "BranchID": 1,
//       "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
//       "CreatedUserID": userId, // 🔁 try userId.toString() if fails
//       "PriceRounding": 2,
//       "page_no": pageNo,
//       "items_per_page": itemsPerPage,
//       "type": "Sales",
//       "WarehouseID": 1,
//       if (searchQuery != null && searchQuery.isNotEmpty) "search": searchQuery,
//     };

//     print("🔹 REQUEST BODY: $body");

//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: jsonEncode(body),
//     );

//     print("🔹 STATUS CODE: ${response.statusCode}");
//     print("🔹 RESPONSE BODY: ${response.body}");

//     if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body);

//       /// 🔥 IMPORTANT DEBUG
//       if (jsonResponse['success'] != 6000) {
//         throw Exception(
//           "API ERROR: ${jsonResponse['message'] ?? jsonResponse}",
//         );
//       }

//       final List data = jsonResponse['data'] ?? [];

      

//       return data.map((item) => SaleModel.fromJson(item)).toList();
//     } else {
//       throw Exception(
//         "SERVER ERROR: ${response.statusCode} - ${response.body}",
        
//       );
//     }
//   }
// }
