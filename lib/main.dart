// ignore_for_file: unused_element, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(SkyLinerApp());
}

class SkyLinerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/flight_search': (context) => FlightSearchPage(),
        '/flight_results': (context) => FlightResultsPage(),
        '/flight_details': (context) => FlightDetailsPage(),
        '/booking_history': (context) => BookingHistoryPage(),
        '/profile': (context) => ProfilePage(),
        '/profile_edit': (context) => ProfileEditPage(),
      },
    );
  }
}

final dummyFlights = [
  {'id': 1, 'name': 'Flight A', 'origin': 'New York', 'destination': 'Los Angeles', 'price': 200.0, 'date': '2025-03-20', 'departure': '08:00', 'arrival': '11:30'},
  {'id': 2, 'name': 'Flight B', 'origin': 'New York', 'destination': 'Los Angeles', 'price': 220.0, 'date': '2025-03-20', 'departure': '12:00', 'arrival': '15:30'},
  {'id': 3, 'name': 'Flight C', 'origin': 'New York', 'destination': 'Los Angeles', 'price': 210.0, 'date': '2025-03-21', 'departure': '14:00', 'arrival': '17:30'},
  {'id': 4, 'name': 'Flight D', 'origin': 'Chicago', 'destination': 'Houston', 'price': 150.0, 'date': '2025-03-20', 'departure': '09:00', 'arrival': '11:00'},
  {'id': 5, 'name': 'Flight E', 'origin': 'Chicago', 'destination': 'Houston', 'price': 180.0, 'date': '2025-03-21', 'departure': '13:00', 'arrival': '15:00'},
  {'id': 6, 'name': 'Flight F', 'origin': 'San Francisco', 'destination': 'Seattle', 'price': 100.0, 'date': '2025-03-20', 'departure': '10:00', 'arrival': '12:00'},
  {'id': 7, 'name': 'Flight G', 'origin': 'San Francisco', 'destination': 'Seattle', 'price': 120.0, 'date': '2025-03-21', 'departure': '16:00', 'arrival': '18:00'},
  {'id': 8, 'name': 'Flight H', 'origin': 'New York', 'destination': 'Chicago', 'price': 170.0, 'date': '2025-03-20', 'departure': '07:00', 'arrival': '09:30'},
  {'id': 9, 'name': 'Flight I', 'origin': 'Houston', 'destination': 'San Francisco', 'price': 190.0, 'date': '2025-03-20', 'departure': '11:00', 'arrival': '14:30'},
  {'id': 10, 'name': 'Flight J', 'origin': 'New York', 'destination': 'Los Angeles', 'price': 230.0, 'date': '2025-03-21', 'departure': '18:00', 'arrival': '21:30'},
  {'id': 11, 'name': 'Flight K', 'origin': 'Chicago', 'destination': 'New York', 'price': 175.0, 'date': '2025-03-20', 'departure': '08:30', 'arrival': '11:00'},
  {'id': 12, 'name': 'Flight L', 'origin': 'Seattle', 'destination': 'San Francisco', 'price': 110.0, 'date': '2025-03-21', 'departure': '12:30', 'arrival': '14:30'},
  {'id': 13, 'name': 'Flight M', 'origin': 'Houston', 'destination': 'Chicago', 'price': 160.0, 'date': '2025-03-20', 'departure': '10:30', 'arrival': '13:00'},
  {'id': 14, 'name': 'Flight N', 'origin': 'Los Angeles', 'destination': 'New York', 'price': 240.0, 'date': '2025-03-21', 'departure': '20:00', 'arrival': '23:30'},
];

void showPopup(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

class SkyLinerTopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  SkyLinerTopNavBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'SkyLiner',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Fill out the details to access your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/flight_search', arguments: {'isGuest': false});
                },
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text('Forgot Password?'),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account? '),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'SkyLiner',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Let’s get started by filling out the form below.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/flight_search', arguments: {'isGuest': false});
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/flight_search', arguments: {'isGuest': true});
                },
                child: Text('Continue as Guest'),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(String label, {bool obscureText = false}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label,
      ),
    ),
  );
}

Widget _buildButton(BuildContext context, String text, String route) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 60),
    ),
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    child: Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    ),
  );
}

Widget _buildBottomNav(BuildContext context, String text, String route) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    ),
  );
}


// Other pages (FlightSearchPage, etc.) remain unchanged.


class FlightSearchPage extends StatefulWidget {
  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController arrivalController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final bool isGuest = args?['isGuest'] ?? false;

    return Scaffold(
      appBar: SkyLinerTopNavBar(title: 'SkyLiner - Flight Search'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: departureController,
              decoration: InputDecoration(labelText: 'Departure City'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: arrivalController,
              decoration: InputDecoration(labelText: 'Arrival City'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (pickedDate != null) {
                  setState(() {
                    dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                  });
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (departureController.text.isEmpty ||
                    arrivalController.text.isEmpty ||
                    dateController.text.isEmpty) {
                  showPopup(context, 'Error', 'Please fill all fields.');
                  return;
                }
                Navigator.pushNamed(
                  context,
                  '/flight_results',
                  arguments: {
                    'departureCity': departureController.text,
                    'arrivalCity': arrivalController.text,
                    'date': dateController.text,
                  },
                );
              },
              child: Text('Search Flights'),
            ),
            if (!isGuest) ...[
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/booking_history');
                },
                child: Text('View Booking History'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('View Profile'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}


// Other pages and widgets remain the same but should use the SkyLinerTopNavBar for consistency

class FlightResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String departureCity = (args?['departureCity'] ?? '').trim().toLowerCase();
    final String arrivalCity = (args?['arrivalCity'] ?? '').trim().toLowerCase();
    final String date = (args?['date'] ?? '').trim();

    final filteredFlights = dummyFlights.where((flight) =>
      flight['origin'].toString().trim().toLowerCase() == departureCity &&
      flight['destination'].toString().trim().toLowerCase() == arrivalCity &&
      flight['date'].toString().trim() == date
    ).toList();

     return Scaffold(
      appBar: AppBar(title: Text('Flight Results')),
      body: filteredFlights.isEmpty
          ? Center(child: Text('No flights available for selected criteria'))
          : ListView.builder(
              itemCount: filteredFlights.length,
              itemBuilder: (context, index) {
                final flight = filteredFlights[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(flight['name'] as String),
                    subtitle: Text('${flight['origin']} → ${flight['destination']}\nDate: ${flight['date']}\nPrice: \$${flight['price']}'),
                    onTap: () {
                      Navigator.pushNamed(context, '/flight_details', arguments: flight);
                    },
                  ),
                );
              },
            ),
    );
  }
}


class FlightDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? flight = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (flight == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Flight Details')),
        body: Center(child: Text('No flight details available.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Flight Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flight ID: ${flight['id']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Flight Name: ${flight['name']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Origin: ${flight['origin']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Destination: ${flight['destination']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Departure Time: ${flight['departure']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Arrival Time: ${flight['arrival']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Date: ${flight['date']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Price: \$${flight['price']}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Booking Confirmed'),
                      content: Text('You have successfully booked ${flight['name']}.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Book Flight'),
            ),
          ],
        ),
      ),
    );
  }
}





class BookingHistoryPage extends StatefulWidget {
  @override
  _BookingHistoryPageState createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  List<Map<String, dynamic>> dummyBookings = [
    {'id': 1, 'flightName': 'Flight A', 'status': 'Confirmed'},
    {'id': 2, 'flightName': 'Flight B', 'status': 'Cancelled'},
  ];

  void cancelBooking(int index) {
    setState(() {
      dummyBookings[index]['status'] = 'Cancelled';
    });
  }

  void showPopup(BuildContext context, String title, String message, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                cancelBooking(index);
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SkyLiner - Booking History')),
      body: dummyBookings.isEmpty
          ? Center(child: Text('No bookings yet!'))
          : ListView.builder(
              itemCount: dummyBookings.length,
              itemBuilder: (context, index) {
                final booking = dummyBookings[index];
                return Card(
                  child: ListTile(
                    title: Text('Booking: ${booking['flightName']}'),
                    subtitle: Text('Status: ${booking['status']}'),
                    trailing: booking['status'] == 'Confirmed'
                        ? IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showPopup(
                                context,
                                'Booking Cancelled',
                                'You have cancelled booking for ${booking['flightName']}',
                                index,
                              );
                            },
                          )
                        : null, // No delete button if already cancelled
                  ),
                );
              },
            ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SkyLiner - Profile')),
      body: Center( // Centers the contents of the screen
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adds padding to the Column
          child: Column(
            mainAxisSize: MainAxisSize.min, // Shrinks the Column to its contents' size
            crossAxisAlignment: CrossAxisAlignment.center, // Aligns content horizontally
            children: [
              Text('Name: John Doe'),
              Text('Email: john.doe@example.com'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile_edit');
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProfileEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SkyLiner - Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                showPopup(context, 'Profile Updated', 'Your profile has been updated successfully.');
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
