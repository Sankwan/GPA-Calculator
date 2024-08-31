import 'package:flutter/material.dart';
import 'package:gpa_calculator/screens/gpa_screen.dart';
import 'package:gpa_calculator/screens/homepage.dart';
import 'package:gpa_calculator/utils/custom_navigations.dart';
// import 'package:gpa_calculator/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Function to handle login button press
  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the validation passes, show a snackbar and navigate to the homepage
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged In')),
      );
      // Navigate to the GPA Screen after a short delay to allow the snackbar to show
      nextNavRemoveHistory(context, const HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        //form widget
        child: SafeArea(
          child: Form(
            key: _formKey,
            //the scrollview prevents pixel overflow
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'LOG IN',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text('Input your credentials below'),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    height: screenHeight * 0.4,
                    child: const Image(
                      image: AssetImage('assets/images/login image.png'),
                    ),
                  ),
                  // Email textfield with validator
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.mail),
                        hintText: 'Email here',
                        labelStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      //validator for email
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Password textfield with validator
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: TextFormField(
                      controller: _passwordController,
                      //decoration begins here
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password here',
                        labelStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Login Here'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
