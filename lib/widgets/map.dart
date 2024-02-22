import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Choose Payment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Location Icon with Text
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Text(
                  'Choose Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Payment Method Text
            Text(
              'How would you like to pay?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // List of Payment Options
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Cash'),
                  onTap: () {
                    // Handle onTap for "При достава"
                  },
                ),
                ListTile(
                  title: Text('Credit card'),
                  onTap: () {
                    // Handle onTap for "Со кредитна картичка"
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Pay Button
            ElevatedButton(
              onPressed: () {
                // Handle Pay button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,

                padding: EdgeInsets.symmetric(vertical: 20),
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
              ),
              child: Text('Pay'),

            ),
          ],
        ),
      ),
    );
  }
}
