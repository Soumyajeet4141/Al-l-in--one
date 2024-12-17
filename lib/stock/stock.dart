import 'package:flutter/material.dart';

class StockItem {
  final String itemId;
  final int quantity;
  final double amount;
  final double totalAmount;
  final String batchNo;

  StockItem({
    required this.itemId,
    required this.quantity,
    required this.amount,
    required this.totalAmount,
    required this.batchNo,
  });
}

class StockListScreen extends StatefulWidget {
  @override
  _StockListScreenState createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  late Future<List<StockItem>> futureStockItems;

  @override
  void initState() {
    super.initState();
    futureStockItems = fetchStockItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.tealAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.teal.withOpacity(0.6),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inventory, color: Colors.white, size: 30),
                    SizedBox(width: 8),
                    Text(
                      'Stock Overview',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by Item ID...',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      prefixIcon: Icon(Icons.search, color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<StockItem>>(
        future: futureStockItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return _buildStockCard(item);
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildStockCard(StockItem item) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Item ID', item.itemId, Icons.inventory),
            _buildInfoRow('Quantity', '${item.quantity}', Icons.format_list_numbered),
            _buildInfoRow('Amount', '\$${item.amount.toStringAsFixed(2)}', Icons.attach_money),
            _buildInfoRow('Total Amount', '\$${item.totalAmount.toStringAsFixed(2)}', Icons.monetization_on),
            _buildInfoRow('Batch No', item.batchNo, Icons.batch_prediction),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.teal, size: 28),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.teal[600],
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<StockItem>> fetchStockItems() async {
  await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  return [
    StockItem(itemId: 'A123', quantity: 50, amount: 20.0, totalAmount: 1000.0, batchNo: 'B2023'),
    StockItem(itemId: 'B456', quantity: 30, amount: 15.0, totalAmount: 450.0, batchNo: 'B2024'),
    StockItem(itemId: 'C789', quantity: 100, amount: 10.0, totalAmount: 1000.0, batchNo: 'B2025'),
  ];
}
