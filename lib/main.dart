import 'package:flutter/material.dart';
import 'package:thesilappflutter/Adminpage.dart';
import 'package:thesilappflutter/RegisterUser.dart';
import 'package:thesilappflutter/SignupScreen.dart';

import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'PaymentScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/SignupScreen': (context) => SignupScreen(),
        '/PaymentScreen': (context) => PaymentScreen(),
        '/Adminpage': (context) => Adminpage(),
        '/RegisterUser': (context) => RegisterUser(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('WELCOME', style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xff1c2e4a),
            ),),
            Container(
              height: 250,
              width: 250,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/tafal.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text('TASAHIL', style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xff1c2e4a),
            ),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150, // Set the width here
                  height: 60, // Set the height here
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1c2e4a), // Background color
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Squared shape
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/SignupScreen');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600// Text color
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 150, // Set the width here
                  height: 60, // Set the height here
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1c2e4a), // Background color
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Squared shape
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/LoginScreen');
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600// Text color
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
