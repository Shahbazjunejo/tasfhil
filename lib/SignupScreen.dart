import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                    "Register Your Account",
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
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
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
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
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
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/LoginScreen');
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
                              child: const Text("Signup"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Already Have an Account?",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/LoginScreen');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffffad03),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
