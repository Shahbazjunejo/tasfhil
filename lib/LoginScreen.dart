import 'package:flutter/material.dart';

import 'DatabaseHelper.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (1 / 9),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Login to Your Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * (7 / 10),
                  decoration: const BoxDecoration(
                    color: Color(0xff1c2e4a),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: usernameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'User Name',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 250.0),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/SignupScreen');
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffffad03),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                          //        Navigator.of(context).pushNamed('/HomeScreen');
            
                                  loginUser(usernameController.text, passwordController.text, context);
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: const Color(0xff1c2e4a),
                                  backgroundColor:
                                  const Color(0xffffad03), // Text color
                                  fixedSize:
                                  const Size.fromHeight(50), // Set the height
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Remove rounded border
                                  ),
                                ),
                                child: const Text("Login"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Didn't Have an Account?",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/SignupScreen');
                            },
                            child: const Text(
                              "Signup",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffffad03),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  void loginUser(String username, String password,BuildContext context) async {
    Map<String, dynamic>? user = await DatabaseHelper.instance.getUser(username);

    if (user != null && user[DatabaseHelper.columnPassword] == password) {
      // Login successful
      Navigator.of(context).pushNamed('/HomeScreen',arguments: user);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login failed'),
            content: Text('Wrong username or password'),
            actions: <Widget>[
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
      print('Login failed');
    }
  }
}
