import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('images/download.jpeg'),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 20.0),
              const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10.0),
                  Text('Full Name: John Doe'),
                ],
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 10.0),
                  Text('Date of Birth: January 1, 1990'),
                ],
              ),
              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 20.0),
              const Text(
                'Shipping Address',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text('123 Main St, City, State, Zip Code'),
              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 20.0),
              const Text(
                'Payment Information',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text('Card Number: **** **** **** 1234'),
              const SizedBox(height: 10.0),
              const Text('Expiration Date: 12/24'),
              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality to edit profile
                  },
                  child: const Text('Edit Profile'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
