import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/presentation/widgets/invoice_box_row_widget.dart';
import '../../data/datasources/sale_remote_data_source.dart';
import '../../data/repositories/sale_repository_impl.dart';
import '../../domain/usecases/get_sales_usecase.dart';
import '../../domain/entities/sale.dart';
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
              ///   HEADER
              Padding(
                padding: EdgeInsets.only(left: 18 * w, top: 24 * w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24 * w,
                      ),
                    ),
                    SizedBox(width: 12 * w),
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

              SizedBox(height: 10 * w),
              _divider(),

              SizedBox(height: 10 * w),

              ///   SEARCH + FILTER
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18 * w),
                child: Row(
                  children: [
                    /// SEARCH
                    Expanded(
                      child: Container(
                        height: 50 * w,
                        padding: EdgeInsets.symmetric(horizontal: 12 * w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF08131E),
                          borderRadius: BorderRadius.circular(8 * w),
                          border: Border.all(color: const Color(0xFF1C3347)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Magnifier.png",
                              width: 20 * w,
                            ),
                            SizedBox(width: 8 * w),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15 * w,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.poppins(
                                    color: const Color(0xFF8A8A8A),
                                    fontSize: 15 * w,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                                onChanged: (value) {
                                  _controller.updateSearchQuery(value);

                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10 * w),

                    /// FILTER BUTTON
                    Container(
                      height: 50 * w,
                      padding: EdgeInsets.symmetric(horizontal: 16 * w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B2B30),
                        borderRadius: BorderRadius.circular(8 * w),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/list-filter.png",
                              width: 20 * w,
                            ),
                            SizedBox(width: 8 * w),
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

              SizedBox(height: 10 * w),
              _divider(),

              SizedBox(height: 10 * w),

              Expanded(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    if (_controller.isLoading && _controller.sales.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final query = _searchController.text.toLowerCase();
                    final List<Sale> dummySales = [
                      Sale(
                        voucherNo: 'INV-001',
                        customerName: 'John Doe',
                        status: 'Pending',
                        grandTotal: 1250.00,
                      ),
                      Sale(
                        voucherNo: 'INV-002',
                        customerName: 'Sarah Smith',
                        status: 'Paid',
                        grandTotal: 2400.50,
                      ),
                      Sale(
                        voucherNo: 'INV-003',
                        customerName: 'Mike Ross',
                        status: 'Pending',
                        grandTotal: 980.00,
                      ),
                      Sale(
                        voucherNo: 'INV-004',
                        customerName: 'Emily Blunt',
                        status: 'Paid',
                        grandTotal: 5600.00,
                      ),
                      Sale(
                        voucherNo: 'INV-005',
                        customerName: 'Robert Brown',
                        status: 'Cancelled',
                        grandTotal: 150.00,
                      ),
                    ];

                    final displaySales =
                        (_controller.sales.isNotEmpty
                                ? _controller.sales
                                : dummySales)
                            .where(
                              (sale) =>
                                  sale.customerName.toLowerCase().contains(
                                    query,
                                  ) ||
                                  sale.voucherNo.toLowerCase().contains(query),
                            )
                            .toList();

                    if (displaySales.isEmpty) {
                      return Center(
                        child: Text(
                          "No results found",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14 * w,
                          ),
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: _handleTap,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _opacity,
                        child: Container(
                          padding: EdgeInsets.all(12 * w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16 * w),
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: displaySales.length,
                            separatorBuilder: (_, __) => gradientDivider(w),
                            itemBuilder: (_, index) {
                              final sale = displaySales[index];
                              return invoiceRow(
                                w,
                                invoiceNo: sale.voucherNo,
                                customerName: sale.customerName,
                                status: sale.status,
                                amount: sale.grandTotal,
                                currency: 'SAR',
                              );
                            },
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

  ///   DIVIDER
  Widget _divider() {
    return Container(height: 1, color: const Color(0xFF1C3347));
  }
}
