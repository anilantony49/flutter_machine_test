import '../../domain/entities/sale.dart';

class SaleModel extends Sale {
  SaleModel({
    required super.voucherNo,
    required super.customerName,
    required super.status,
    required super.grandTotal,
    // super.currency,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) {
    return SaleModel(
      voucherNo: json['VoucherNo'] ?? '',
      customerName: json['CustomerName'] ?? '',
      status: json['Status'] ?? '',
      grandTotal: (json['GrandTotal'] ?? 0).toDouble(),
      // currency: json['CurrencySymbol'] ?? 'SAR',
    );
  }
}
