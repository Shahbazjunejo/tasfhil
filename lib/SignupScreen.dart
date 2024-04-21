import 'package:flutter/material.dart';

import 'DatabaseHelper.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});


  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
   final TextEditingController usernameController = new TextEditingController();
   final TextEditingController nameController = new TextEditingController();
   final TextEditingController contactController = new TextEditingController();



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
                height: 20,
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
                     SizedBox(
                       height: 50,
                       width: 300,
                       child:  TextFormField(
                         keyboardType: TextInputType.name,
                         controller: nameController,
                         style: const TextStyle(color: Colors.white),
                         decoration: const InputDecoration(
                           labelText: 'Name',
                           labelStyle: TextStyle(color: Colors.white),
                           border: OutlineInputBorder(),
                         ),
                       ),

                     ),

                  SizedBox(
                    height: 50,
                    width: 300,
                    child:  TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.name,
                        controller: usernameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),

                  ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          maxLength: 20,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your credit card number';
                            }
                            if (!isValidCreditCard(value)) {
                              return 'Please enter a valid credit card number';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          maxLength: 10,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          maxLength: 14,
                          keyboardType: TextInputType.number,
                          controller: contactController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
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
                                registerUser(usernameController.text, passwordController.text ,nameController.text, emailController.text,contactController.text);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('User  Register'),
                                      content: Text('User has been Register'),
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
     ),
        ));
  }

   bool isValidCreditCard(String input) {
     // Remove any non-digit characters
     input = input.replaceAll(RegExp(r'\D+'), '');

     // Perform additional validation checks
     // For example, you can use the Luhn algorithm to validate credit card numbers

     // For demonstration purposes, this function only checks if the input length is between 13 and 19 characters
     return input.length >= 13 && input.length <= 19;
   }

  void registerUser(String username, String password,String name,String email,String contact) async {
    int id = await DatabaseHelper.instance.insertUser({
      DatabaseHelper.columnName: username,
      DatabaseHelper.columnPassword: password,
      DatabaseHelper.Name:name,
      DatabaseHelper.columnemail :email,
      DatabaseHelper.columncontact:contact ,
    });
    if (id != null) {
      // Registration successful
      print('User registered successfully');
    } else {
      // Registration failed
      print('Failed to register user');
    }
  }



}
