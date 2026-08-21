import 'package:flutter/material.dart';
import 'package:e_commerce_mobile_app/screen/home_screen.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount;
  final List<Map<String, dynamic>> cartItems;

  const PaymentScreen({
    super.key,
    required this.totalAmount,
    required this.cartItems, required Map<String, Object?> shippingData,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedPaymentMethod = 0; // 0: Credit Card, 1: Apple Pay, 2: PayPal
  bool _saveCardDetails = true;

  final TextEditingController _cardNumberController =
      TextEditingController(text: '4532  ••••  ••••  8821');
  final TextEditingController _cardHolderController =
      TextEditingController(text: 'Pham');
  final TextEditingController _expiryController =
      TextEditingController(text: '08/28');
  final TextEditingController _cvvController =
      TextEditingController(text: '•••');

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 16,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Check out',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Indicator Bar
            _buildStepProgress(),
            const SizedBox(height: 24),

            // Section Header
            const Text(
              'STEP 2',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Payment',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Select Payment Method
            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildPaymentTypeTile(
                    index: 0,
                    label: 'Card',
                    icon: Icons.credit_card,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildPaymentTypeTile(
                    index: 1,
                    label: 'Apple Pay',
                    icon: Icons.apple,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildPaymentTypeTile(
                    index: 2,
                    label: 'PayPal',
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Card details inputs (only active when Card is selected)
            if (_selectedPaymentMethod == 0) ...[
              _buildInputField(
                label: 'Cardholder name',
                isRequired: true,
                controller: _cardHolderController,
              ),
              _buildInputField(
                label: 'Card number',
                isRequired: true,
                controller: _cardNumberController,
                suffixIcon: const Icon(Icons.credit_card, color: Colors.grey),
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildInputField(
                      label: 'Expiry date',
                      isRequired: true,
                      controller: _expiryController,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildInputField(
                      label: 'CVV / CVC',
                      isRequired: true,
                      controller: _cvvController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Save Card Checkbox
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _saveCardDetails,
                      activeColor: Colors.black,
                      side: BorderSide(
                          color: Colors.grey.shade300, width: 1.5),
                      onChanged: (val) {
                        setState(() {
                          _saveCardDetails = val ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Save payment information for future purchases',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 28),

            // Order Total Summary Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '\$${widget.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Place Order Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  _showSuccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF333333),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Confirm & Pay',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Visual Step Progress Bar
  Widget _buildStepProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on, size: 20, color: Color(0xFF5E8A75)),
        _buildDottedLine(active: true),
        const Icon(Icons.credit_card, size: 20, color: Colors.black),
        _buildDottedLine(active: false),
        const Icon(Icons.check_circle, size: 20, color: Colors.grey),
      ],
    );
  }

  Widget _buildDottedLine({required bool active}) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
          (index) => Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              color: active ? const Color(0xFF5E8A75) : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentTypeTile({
    required int index,
    required String label,
    required IconData icon,
  }) {
    final bool isSelected = _selectedPaymentMethod == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFAFAFA) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF5E8A75) : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? const Color(0xFF5E8A75) : Colors.black,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? const Color(0xFF5E8A75) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required bool isRequired,
    required TextEditingController controller,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
              children: [
                if (isRequired)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),

          const Icon(
            Icons.check_circle,
            color: Color(0xFF5E8A75),
            size: 64,
          ),

          const SizedBox(height: 16),

          const Text(
            'Order Placed!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Your payment was processed successfully.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Close the success dialog
                Navigator.of(dialogContext).pop();

                // Go directly to HomeScreen
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const Homescreen(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF333333),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}