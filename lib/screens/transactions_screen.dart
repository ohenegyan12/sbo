import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

class TransactionListItem {
  final String title;
  final String subtitle;
  final String amount;
  final String imagePath;
  final String date;

  TransactionListItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.imagePath,
    required this.date,
  });
}

class TransactionsScreen extends StatefulWidget {
  final bool isTab;
  const TransactionsScreen({super.key, this.isTab = false});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final List<TransactionListItem> _allTransactions = [
    TransactionListItem(
      title: 'DSTV Subscription',
      subtitle: '10:44 AM',
      amount: 'GHS 250.00',
      imagePath: AppAssets.dstvLogo,
      date: 'Today',
    ),
    TransactionListItem(
      title: 'MTN Data Purchase',
      subtitle: '09:15 AM',
      amount: 'GHS 50.00',
      imagePath: AppAssets.mtnLogo,
      date: 'Today',
    ),
    TransactionListItem(
      title: 'MTN Data Purchase',
      subtitle: '08:30 PM',
      amount: 'GHS 100.00',
      imagePath: AppAssets.mtnLogo,
      date: 'Yesterday',
    ),
    TransactionListItem(
      title: 'DSTV Subscription',
      subtitle: '11:20 AM',
      amount: 'GHS 250.00',
      imagePath: AppAssets.dstvLogo,
      date: 'June 27, 2024',
    ),
    TransactionListItem(
      title: 'MTN Data Purchase',
      subtitle: '04:44 PM',
      amount: 'GHS 25.00',
      imagePath: AppAssets.mtnLogo,
      date: 'June 27, 2024',
    ),
  ];

  late List<TransactionListItem> _filteredTransactions;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredTransactions = _allTransactions;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredTransactions = _allTransactions
          .where((t) => t.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: widget.isTab 
            ? null 
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
                onPressed: () => Navigator.of(context).pop(),
              ),
        title: const Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6FA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search Transactions',
                  hintStyle: TextStyle(
                    color: AppColors.darkBackground.withOpacity(0.3),
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.darkBackground.withOpacity(0.3),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              ),
            ),
          ),
          
          // Transactions List
          Expanded(
            child: _filteredTransactions.isEmpty
                ? Center(
                    child: Text(
                      'No transactions found',
                      style: TextStyle(
                        color: AppColors.darkBackground.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100), // Space for nav bar
                    itemCount: _getUniqueDates().length,
                    itemBuilder: (context, dateIndex) {
                      String date = _getUniqueDates()[dateIndex];
                      List<TransactionListItem> itemsForDate = _filteredTransactions
                          .where((t) => t.date == date)
                          .toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                            child: Text(
                              date,
                              style: TextStyle(
                                color: const Color(0xFF081730).withOpacity(0.4),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ...itemsForDate.map((item) => _buildTransactionItem(item)),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  List<String> _getUniqueDates() {
    return _filteredTransactions.map((t) => t.date).toSet().toList();
  }

  Widget _buildTransactionItem(TransactionListItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Row(
        children: [
          // Transaction Logo
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Transaction Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Color(0xFF081730),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    color: const Color(0xFF081730).withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Amount
          Text(
            item.amount,
            style: const TextStyle(
              color: Color(0xFF081730),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
