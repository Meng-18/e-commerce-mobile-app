import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xffeee9eb),
          width: 1,
        ),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.tune,
          size: 19,
          color: Color(0xff85808d),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const FilterBottomSheet();
            },
          );
        },
      ),
    );
  }
}

// ==================================================
// FILTER BOTTOM SHEET
// ==================================================

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() =>
      _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues priceRange = const RangeValues(10, 80);

  int selectedColor = -1;
  int selectedRating = 5;
  String selectedCategory = 'Crop Tops';
  String? selectedDiscount;

  final List<Color> colors = [
    const Color(0xffb8873d),
    const Color(0xffbd5a59),
    const Color(0xff4c5a63),
    const Color(0xff454b4e),
    const Color(0xffdddddf),
    const Color(0xff6d5b51),
    const Color(0xffc6afb1),
  ];

  final List<String> discounts = [
    '50% off',
    '40% off',
    '30% off',
    '25% off',
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.86,
      minChildSize: 0.55,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xfffaf9fa),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(
                34,
                25,
                34,
                26,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ==========================================
                  // HEADER
                  // ==========================================

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff343137),
                        ),
                      ),

                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.tune,
                          size: 19,
                          color: Color(0xff343137),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 17),

                  const Divider(
                    height: 1,
                    color: Color(0xffe8e4e5),
                  ),

                  const SizedBox(height: 18),

                  // ==========================================
                  // PRICE
                  // ==========================================

                  const Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xff55515a),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Theme(
                    data: Theme.of(context).copyWith(
                      sliderTheme: SliderThemeData(
                        trackHeight: 1,
                        activeTrackColor:
                            const Color(0xff4b474b),
                        inactiveTrackColor:
                            const Color(0xffe3dfe1),
                        thumbColor: Colors.white,
                        overlayColor: Colors.transparent,
                        rangeThumbShape:
                            const RoundRangeSliderThumbShape(
                          enabledThumbRadius: 5,
                        ),
                      ),
                    ),
                    child: RangeSlider(
                      values: priceRange,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      labels: RangeLabels(
                        '\$${priceRange.start.round()}',
                        '\$${priceRange.end.round()}',
                      ),
                      onChanged: (values) {
                        setState(() {
                          priceRange = values;
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${priceRange.start.round()}',
                          style: const TextStyle(
                            fontSize: 9,
                            color: Color(0xff343137),
                          ),
                        ),
                        Text(
                          '\$${priceRange.end.round()}',
                          style: const TextStyle(
                            fontSize: 9,
                            color: Color(0xff343137),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 23),

                  // ==========================================
                  // COLOR
                  // ==========================================

                  const Text(
                    'Color',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xff55515a),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 11,
                    children: List.generate(
                      colors.length,
                      (index) {
                        final isSelected =
                            selectedColor == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = index;
                            });
                          },
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors[index],
                              border: isSelected
                                  ? Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==========================================
                  // STAR RATING
                  // ==========================================

                  const Text(
                    'Star Rating',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xff55515a),
                    ),
                  ),

                  const SizedBox(height: 13),

                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        final rating = index + 1;
                        final isSelected =
                            selectedRating == rating;

                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 9),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedRating = rating;
                              });
                            },
                            child: Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xff454446)
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(
                                          0xff454446,
                                        )
                                      : const Color(
                                          0xff77727a,
                                        ),
                                  width: 0.8,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 9,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(
                                            0xff454148,
                                          ),
                                  ),
                                  const SizedBox(width: 1),
                                  Text(
                                    '$rating',
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(
                                              0xff454148,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ==========================================
                  // CATEGORY
                  // ==========================================

                  const Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xff55515a),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    height: 31,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xffd6d1d3),
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: Color(0xff454148),
                        ),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xff55515a),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Crop Tops',
                            child: Text('♧  Crop Tops'),
                          ),
                          DropdownMenuItem(
                            value: 'Jacket',
                            child: Text('Jacket'),
                          ),
                          DropdownMenuItem(
                            value: 'Dresses',
                            child: Text('Dresses'),
                          ),
                          DropdownMenuItem(
                            value: 'Skirts',
                            child: Text('Skirts'),
                          ),
                          DropdownMenuItem(
                            value: 'Jeans',
                            child: Text('Jeans'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedCategory = value;
                            });
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ==========================================
                  // DISCOUNT
                  // ==========================================

                  const Text(
                    'Discount',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xff55515a),
                    ),
                  ),

                  const SizedBox(height: 11),

                  Wrap(
                    spacing: 8,
                    runSpacing: 9,
                    children: discounts.map((discount) {
                      final isSelected =
                          selectedDiscount == discount;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDiscount = discount;
                          });
                        },
                        child: Container(
                          height: 29,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xff454446)
                                : Colors.transparent,
                            borderRadius:
                                BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xff77727a),
                              width: 0.8,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                discount,
                                style: TextStyle(
                                  fontSize: 9,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(
                                          0xff454148,
                                        ),
                                ),
                              ),

                              const SizedBox(width: 8),

                              Icon(
                                Icons.close,
                                size: 12,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(
                                        0xff454148,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // ==========================================
                  // RESET + APPLY
                  // ==========================================

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            priceRange =
                                const RangeValues(10, 80);
                            selectedColor = -1;
                            selectedRating = 5;
                            selectedCategory = 'Crop Tops';
                            selectedDiscount = null;
                          });
                        },
                        child: const Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff55515a),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 78,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xff454446),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(17),
                            ),
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}