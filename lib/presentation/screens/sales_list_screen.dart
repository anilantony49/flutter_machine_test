import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/widgets/invoice_box_row_widget.dart';
import '../../data/datasources/sale_remote_data_source.dart';
import '../../data/repositories/sale_repository_impl.dart';
import '../../domain/usecases/get_sales_usecase.dart';
import '../controllers/sale_list_controller.dart';

class SalesListScreen extends StatefulWidget {
  const SalesListScreen({super.key});

  @override
  State<SalesListScreen> createState() => _SalesListScreenState();
}

class _SalesListScreenState extends State<SalesListScreen> {
  late final SaleListController _controller;
  final _searchController = TextEditingController();
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    final remote = SaleRemoteDataSourceImpl();
    final repo = SaleRepositoryImpl(remoteDataSource: remote);
    final usecase = GetSalesUseCase(repo);
    _controller = SaleListController(getSalesUseCase: usecase);
    _controller.fetchSales();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() => _opacity = 0.5);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 430;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18 * w),
          child: Column(
            children: [
              /// 🔹 HEADER
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 70),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Invoices",
                      style: GoogleFonts.poppins(
                        fontSize: 16 * w,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              _divider(),

              const SizedBox(height: 10),

              /// 🔹 SEARCH + FILTER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    /// SEARCH
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF08131E),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFF1C3347)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Magnifier.png",
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                style: GoogleFonts.poppins(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.poppins(
                                    color: const Color(0xFF8A8A8A),
                                    fontSize: 15 * w,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  _controller.updateSearchQuery(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// FILTER BUTTON
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B2B30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/list-filter.png",
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Add Filters",
                              style: GoogleFonts.poppins(
                                fontSize: 15 * w,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              _divider(),

              const SizedBox(height: 10),

              Expanded(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    if (_controller.isLoading && _controller.sales.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (_controller.errorMessage != null &&
                        _controller.sales.isEmpty) {
                      return Center(
                        child: Text(
                          _controller.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (_controller.sales.isEmpty) {
                      return Center(
                        child: Text(
                          "No sales found",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      );
                    }

                    return Expanded(
                      child: GestureDetector(
                        onTap: _handleTap,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _opacity,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListView.separated(
                              itemCount: _controller.sales.length,
                              separatorBuilder: (_, __) => gradientDivider(w),
                              itemBuilder: (_, index) {
                                final sale = _controller.sales[index];
                                return invoiceRow(
                                  w,
                                  invoiceNo: sale.voucherNo,
                                  customerName: sale.customerName,
                                  status: sale.status,
                                  amount: sale.grandTotal,
                                  // currency: sale.currency,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 DIVIDER
  Widget _divider() {
    return Container(height: 1, color: const Color(0xFF1C3347));
  }
}
