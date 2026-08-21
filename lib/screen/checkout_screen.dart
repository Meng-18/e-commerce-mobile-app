import 'package:e_commerce_mobile_app/screen/payment_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final double totalAmount;
  final List<Map<String, dynamic>> cartItems;

  const CheckoutScreen({
    super.key,
    required this.totalAmount,
    required this.cartItems,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  int _selectedShippingMethod = 0;
  bool _copyAddress = false;
  String? _selectedCountry;

  final TextEditingController _firstNameController =
      TextEditingController(text: 'Pham');
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _couponController = TextEditingController();

  final List<String> _countries = ['United States', 'Vietnam', 'Canada', 'UK'];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _phoneController.dispose();
    _couponController.dispose();
    super.dispose();
  }

  void _navigateToPayment() {
    if (_formKey.currentState!.validate()) {
      // Gather shipping information
      final shippingData = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'country': _selectedCountry,
        'street': _streetController.text,
        'city': _cityController.text,
        'state': _stateController.text,
        'zip': _zipController.text,
        'phone': _phoneController.text,
        'shippingMethod': _selectedShippingMethod,
        'couponCode': _couponController.text,
        'copyAddress': _copyAddress,
      };

      // Navigate to PaymentScreen passing data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentScreen(
            totalAmount: widget.totalAmount,
            cartItems: widget.cartItems,
            shippingData: shippingData,
          ),
        ),
      );
    }
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStepProgress(),
              const SizedBox(height: 24),
              const Text(
                'STEP 1',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Shipping',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Form Fields
              _buildInputField(
                label: 'First name',
                isRequired: true,
                controller: _firstNameController,
              ),
              _buildInputField(
                label: 'Last name',
                isRequired: true,
                controller: _lastNameController,
              ),
              _buildDropdownField(
                label: 'Country',
                isRequired: true,
              ),
              _buildInputField(
                label: 'Street name',
                isRequired: true,
                controller: _streetController,
              ),
              _buildInputField(
                label: 'City',
                isRequired: true,
                controller: _cityController,
              ),
              _buildInputField(
                label: 'State / Province',
                isRequired: false,
                controller: _stateController,
              ),
              _buildInputField(
                label: 'Zip-code',
                isRequired: true,
                controller: _zipController,
              ),
              _buildInputField(
                label: 'Phone number',
                isRequired: true,
                controller: _phoneController,
              ),
              const SizedBox(height: 16),

              const Text(
                'Shipping method',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              _buildShippingOption(
                index: 0,
                price: 'Free',
                title: 'Delivery to home',
                subtitle: 'Delivery from 3 to 7 business days',
              ),
              const SizedBox(height: 10),
              _buildShippingOption(
                index: 1,
                price: '\$ 9.90',
                title: 'Delivery to home',
                subtitle: 'Delivery from 4 to 6 business days',
              ),
              const SizedBox(height: 10),
              _buildShippingOption(
                index: 2,
                price: '\$ 9.90',
                title: 'Fast Delivery',
                subtitle: 'Delivery from 2 to 3 business days',
              ),
              const SizedBox(height: 28),

              const Text(
                'Coupon Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _couponController,
                        decoration: const InputDecoration(
                          hintText: 'Have a code? type it here...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Validate',
                        style: TextStyle(
                          color: Color(0xFF5E8A75),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              const Text(
                'Billing Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _copyAddress,
                      activeColor: Colors.black,
                      side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                      onChanged: (val) {
                        setState(() {
                          _copyAddress = val ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Copy address data from shipping',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Connected Navigation Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _navigateToPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF333333),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Continue to payment',
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
      ),
    );
  }

  Widget _buildStepProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on, size: 20, color: Colors.black),
        _buildDottedLine(),
        const Icon(Icons.credit_card, size: 20, color: Colors.grey),
        _buildDottedLine(),
        const Icon(Icons.check_circle, size: 20, color: Colors.grey),
      ],
    );
  }

  Widget _buildDottedLine() {
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
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required bool isRequired,
    required TextEditingController controller,
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
          TextFormField(
            controller: controller,
            validator: (value) {
              if (isRequired && (value == null || value.trim().isEmpty)) {
                return 'Field is required';
              }
              return null;
            },
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200),
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required bool isRequired,
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
          DropdownButtonFormField<String>(
            value: _selectedCountry,
            validator: (value) {
              if (isRequired && value == null) {
                return 'Field is required';
              }
              return null;
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade200),
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            items: _countries
                .map((country) => DropdownMenuItem(
                      value: country,
                      child: Text(
                        country,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                _selectedCountry = val;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShippingOption({
    required int index,
    required String price,
    required String title,
    required String subtitle,
  }) {
    final bool isSelected = _selectedShippingMethod == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedShippingMethod = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFAFAFA) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF5E8A75)
                      : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5E8A75),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}