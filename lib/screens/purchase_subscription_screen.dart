import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum SubscriptionType { dstv, mtn }

class PurchaseSubscriptionScreen extends StatefulWidget {
  final SubscriptionType type;
  const PurchaseSubscriptionScreen({super.key, required this.type});

  @override
  State<PurchaseSubscriptionScreen> createState() => _PurchaseSubscriptionScreenState();
}

class _PurchaseSubscriptionScreenState extends State<PurchaseSubscriptionScreen> {
  late TextEditingController _packageController;
  late TextEditingController _amountController;
  late TextEditingController _icuController;
  late TextEditingController _serialController;

  @override
  void initState() {
    super.initState();
    _packageController = TextEditingController(text: 'DSTV Compact Plus');
    _amountController = TextEditingController(text: 'GHS 250.00');
    _icuController = TextEditingController(text: '1029384756');
    _serialController = TextEditingController(text: 'SN-987654321');
  }

  @override
  void dispose() {
    _packageController.dispose();
    _amountController.dispose();
    _icuController.dispose();
    _serialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDstv = widget.type == SubscriptionType.dstv;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          isDstv ? 'DSTV Subscription' : 'MTN Data Subscription',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isDstv) ..._buildDstvFields() else ..._buildMtnFields(),
                  ],
                ),
              ),
            ),
            
            // Fixed Bottom Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for purchase
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    isDstv ? 'Purchase Subscription' : 'Purchase Data',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDstvFields() {
    return [
      _buildLabel('Package'),
      _buildTextField('Package', controller: _packageController, isReadOnly: true),
      const SizedBox(height: 24),
      _buildLabel('Amount'),
      _buildTextField('Amount', controller: _amountController, isReadOnly: true),
      const SizedBox(height: 24),
      _buildLabel('ICU Number'),
      _buildTextField('enter ICU number', controller: _icuController),
      const SizedBox(height: 24),
      _buildLabel('Serial number'),
      _buildTextField('enter serial number', controller: _serialController),
    ];
  }

  List<Widget> _buildMtnFields() {
    return [
      _buildLabel('Select Package'),
      _buildDropdownField('Select package'),
      const SizedBox(height: 24),
      _buildLabel('Amount'),
      _buildTextField('Amount', isReadOnly: true),
      const SizedBox(height: 24),
      _buildLabel('Duration'),
      _buildDropdownField('Select duration'),
      const SizedBox(height: 24),
      _buildLabel('Destination number'),
      _buildTextField('enter number'),
    ];
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF081730),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          dropdownColor: Colors.white,
          hint: Text(
            hint,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
            ),
          ),
          items: const [], // To be populated
          onChanged: (val) {},
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {TextEditingController? controller, bool isReadOnly = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: isReadOnly ? const Color(0xFFF5F6FA) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        controller: controller,
        readOnly: isReadOnly,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
