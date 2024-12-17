import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dashboard', style: TextStyle(color: Colors.white)),
            CircleAvatar(
              backgroundColor: Colors.blueAccent.shade700,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(context, Icons.person, "My Account"),
            _buildDashboardCard(context, Icons.inventory, "Inventory", MapViewScreen()),
            _buildDashboardCard(context, Icons.search, "Search Mechanic", SearchMechanicScreen()),
            _buildDashboardCard(context, Icons.request_page, "Request"),
            _buildDashboardCard(context, Icons.bar_chart, "Analytics"),
            _buildDashboardCard(context, Icons.contact_mail, "Contact Us"),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, IconData icon, String label, [Widget? route]) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blueAccent),
            SizedBox(height: 8),
            Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class SearchMechanicScreen extends StatelessWidget {
  final List<Map<String, dynamic>> mechanics = [
    {"name": "Henry Curtis", "rate": 5},
    {"name": "Michael Harvey", "rate": 55},
    {"name": "Craig Arnold", "rate": 40},
    {"name": "Ortiz Wheeler", "rate": 60},
    {"name": "Curtis Michael", "rate": 45},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Search Mechanic", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: mechanics.length,
        itemBuilder: (context, index) {
          final mechanic = mechanics[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person, color: Colors.white),
                backgroundColor: Colors.blueAccent,
              ),
              title: Text(mechanic['name']),
              subtitle: Text("\$${mechanic['rate']}/hour"),
              trailing: Icon(Icons.star, color: Colors.amber),
            ),
          );
        },
      ),
    );
  }
}

class MapViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Colors.grey[200],
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 50,
                  child: Icon(Icons.location_pin, color: Colors.blue, size: 36),
                ),
                Positioned(
                  top: 150,
                  right: 50,
                  child: Icon(Icons.location_pin, color: Colors.orange, size: 36),
                ),
                Positioned(
                  bottom: 200,
                  left: 100,
                  child: Icon(Icons.location_pin, color: Colors.pink, size: 36),
                ),
              ],
            ),
          ),

          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Nearby Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 120,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Inventory",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Workplace Section
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMapOption(Icons.schedule, "Schedule"),
                      _buildMapOption(Icons.timeline, "Progress"),
                      _buildMapOption(Icons.receipt, "Invoice"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.mail, color: Colors.white, size: 32),
                    onPressed: () {},
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Icon(Icons.filter_alt, color: Colors.blueAccent, size: 32),
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.white, size: 32),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapOption(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 32, color: Colors.blueAccent),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
