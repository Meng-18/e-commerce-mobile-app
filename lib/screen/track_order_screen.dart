import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const TrackOrderScreen({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final String status = (order['status'] ?? 'pending').toString().toLowerCase();

    final bool isDelivered = status == 'delivery' || status == 'delivered';
    final bool isPending = status == 'pending';
    final bool isCanceled = status == 'cancel' || status == 'canceled' || status == 'cancelled';

    // Build status-specific timeline steps
    final List<Map<String, dynamic>> timeline = _getTimelineData(status);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
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
          'Track Order',
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
            // Dynamic Header Status Date
            Text(
              isCanceled
                  ? 'Canceled on ${order['canceledDate'] ?? order['date'] ?? '15.05.21'}'
                  : isPending
                      ? 'Order Placed on ${order['date'] ?? '15.05.21'}'
                      : 'Delivered on ${order['deliveryDate'] ?? '15.05.21'}',
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                text: 'Tracking Number : ',
                style: const TextStyle(fontSize: 13, color: Colors.grey),
                children: [
                  TextSpan(
                    text: '${order['trackingNumber'] ?? 'IK287368838'}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Dynamic Timeline
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: timeline.length,
              itemBuilder: (context, index) {
                final item = timeline[index];
                final isLast = index == timeline.length - 1;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isCanceled
                                  ? Colors.red
                                  : item['isCurrent']
                                      ? Colors.black
                                      : Colors.grey.shade400,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: isCanceled
                                ? const Icon(
                                    Icons.close,
                                    size: 12,
                                    color: Colors.red,
                                  )
                                : item['isCurrent']
                                    ? Container(
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : Icon(
                                        Icons.check,
                                        size: 12,
                                        color: Colors.grey.shade600,
                                      ),
                          ),
                        ),
                        if (!isLast)
                          Column(
                            children: List.generate(
                              3,
                              (i) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                width: 3,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: isCanceled ? Colors.red.shade200 : Colors.grey.shade400,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item['title'],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: item['isCurrent']
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  color: isCanceled
                                      ? Colors.red
                                      : item['isCurrent']
                                          ? Colors.black
                                          : Colors.grey.shade700,
                                ),
                              ),
                            ),
                            Text(
                              item['date'],
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // Rating Banner (Only visible when Delivered)
            if (isDelivered)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.touch_app_outlined,
                      size: 32,
                      color: Color(0xFFE5C158),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Don't forget to rate",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Rate product to get 5 points for collect.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star_border,
                                size: 18,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Returns timeline list matching current status
  List<Map<String, dynamic>> _getTimelineData(String status) {
    if (status == 'cancel' || status == 'canceled' || status == 'cancelled') {
      return [
        {
          'title': 'Order has been canceled',
          'date': '${order['canceledDate'] ?? order['date'] ?? '15 May 10:20'}',
          'isCurrent': true,
        },
        {
          'title': 'Sender was preparing to ship',
          'date': '12 May 10:01',
          'isCurrent': false,
        },
      ];
    } else if (status == 'pending') {
      return [
        {
          'title': 'Sender is preparing to ship your order',
          'date': '12 May 10:01',
          'isCurrent': true,
        },
        {
          'title': 'Order Placed',
          'date': '12 May 09:30',
          'isCurrent': false,
        },
      ];
    } else {
      // Default: Delivery / Delivered
      return [
        {
          'title': 'Parcel is successfully delivered',
          'date': '15 May 10:20',
          'isCurrent': true,
        },
        {
          'title': 'Parcel is out for delivery',
          'date': '14 May 08:00',
          'isCurrent': false,
        },
        {
          'title': 'Parcel is received at delivery Branch',
          'date': '13 May 17:25',
          'isCurrent': false,
        },
        {
          'title': 'Parcel is in transit',
          'date': '13 May 07:00',
          'isCurrent': false,
        },
        {
          'title': 'Sender has shipped your parcel',
          'date': '12 May 14:25',
          'isCurrent': false,
        },
        {
          'title': 'Sender is preparing to ship your order',
          'date': '12 May 10:01',
          'isCurrent': false,
        },
      ];
    }
  }
}