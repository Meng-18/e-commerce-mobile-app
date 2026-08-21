import 'package:flutter/material.dart';

import '../widgets/home_header.dart';
import '../widgets/menu_sidebar.dart';
import '../widgets/bottom_navigation.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int selectedIndex = 3;

  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Summer Dress',
      'price': 45.00,
      'quantity': 1,
      'size': 'M',
      'image': 'assets/images/product1.png',
    },
    {
      'name': 'Classic Jacket',
      'price': 80.00,
      'quantity': 1,
      'size': 'L',
      'image': 'assets/images/product2.png',
    },
    {
      'name': 'Casual T-Shirt',
      'price': 25.00,
      'quantity': 2,
      'size': 'M',
      'image': 'assets/images/product3.png',
    },
  ];

  double get subtotal {
    return cartItems.fold(
      0,
      (total, item) => total + (item['price'] * item['quantity']),
    );
  }

  double get deliveryFee => cartItems.isEmpty ? 0 : 5.00;

  double get total => subtotal + deliveryFee;

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item removed from cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf8f8),

      // SIDEBAR
      drawer: MenuSidebar(
        selectedMenu: 'Cart',
        onMenuSelected: (menu) {
          Navigator.pop(context);
        },
      ),

      // BODY
      body: Column(
        children: [
          const HomeHeader(
            title: 'My Cart',
          ),
          Expanded(
            child: cartItems.isEmpty
                ? _buildEmptyCart()
                : _buildCartContent(),
          ),
        ],
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCartContent() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
            children: [
              Text(
                '${cartItems.length} items in your cart',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff858296),
                ),
              ),
              const SizedBox(height: 15),
              ...List.generate(
                cartItems.length,
                (index) => _buildCartItem(
                  index,
                  cartItems[index],
                ),
              ),
              const SizedBox(height: 10),
              _buildOrderSummary(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        _buildCheckoutButton(),
      ],
    );
  }

  Widget _buildCartItem(
    int index,
    Map<String, dynamic> item,
  ) {
    return Container(
      height: 125,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 105,
            decoration: BoxDecoration(
              color: const Color(0xfff3f0f1),
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              item['image'],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.shopping_bag_outlined,
                  size: 35,
                  color: Color(0xffaaa6b0),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff29262b),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _removeItem(index),
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: Color(0xff858296),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  'Size: ${item['size']}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff858296),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '\$${item['price'].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff202027),
                      ),
                    ),
                    const Spacer(),
                    _quantityButton(
                      icon: Icons.remove,
                      onTap: () => _decreaseQuantity(index),
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Text(
                        '${item['quantity']}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff29262b),
                        ),
                      ),
                    ),
                    _quantityButton(
                      icon: Icons.add,
                      onTap: () => _increaseQuantity(index),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: const Color(0xfff4f1f2),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Icon(
          icon,
          size: 15,
          color: const Color(0xff454148),
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff29262b),
            ),
          ),
          const SizedBox(height: 16),
          _summaryRow(
            'Subtotal',
            '\$${subtotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 10),
          _summaryRow(
            'Delivery',
            '\$${deliveryFee.toStringAsFixed(2)}',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(
              height: 1,
              color: Color(0xffeee9eb),
            ),
          ),
          _summaryRow(
            'Total',
            '\$${total.toStringAsFixed(2)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String title,
    String value, {
    bool isTotal = false,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 14 : 11,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
            color: isTotal
                ? const Color(0xff202027)
                : const Color(0xff858296),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 15 : 11,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: const Color(0xff29262b),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(
                    totalAmount: total,
                    cartItems: cartItems,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff202027),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Checkout • \$${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 70,
              color: Color(0xffaaa6b0),
            ),
            const SizedBox(height: 18),
            const Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff29262b),
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'Looks like you have not added anything yet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Color(0xff858296),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff202027),
                foregroundColor: Colors.white,
              ),
              child: const Text('Continue Shopping'),
            ),
          ],
        ),
      ),
    );
  }
}