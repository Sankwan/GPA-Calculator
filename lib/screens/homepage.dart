import 'package:flutter/material.dart';
import 'package:gpa_calculator/screens/gpa_screen.dart';
import 'package:gpa_calculator/utils/custom_navigations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // parameters to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextNav(context, GpaScreen());
        },
        child: const Icon(Icons.calculate),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                
              },
              icon: const Icon(Icons.add)),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.question_mark),
                    SizedBox(width: 15),
                    Text("Help"),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.book),
                    SizedBox(width: 15),
                    Text("About App "),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 15),
                    Text("Log Out"),
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 50),
            color: Colors.white,
            elevation: 2,
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.03),
          CircleAvatar(
            radius: screenWidth * 0.2,
            child: ClipOval(
              child: Image.asset('assets/images/profile.jpeg'),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          const Center(
            child: Text(
              'Mr. Owuraku',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          const Divider(),
          SizedBox(height: screenHeight * 0.05),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.13),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.blur_circular_rounded),
                    SizedBox(width: 20),
                    Text('Campus Vibes'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.13),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.bolt),
                    SizedBox(width: 20),
                    Text('Trending News'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.13),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 20),
                    Text('Places'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.13),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 20),
                    Text('Students'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.13),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(width: 20),
                    Text('Notifications'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.25, // Adjusting padding for button
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('VIEW'),
            ),
          ),
        ],
      ),
    );
  }
}
