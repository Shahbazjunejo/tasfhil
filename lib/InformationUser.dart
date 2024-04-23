import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InformationUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Selector Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInfromationScreen(),
    );
  }
}


class UserInfromationScreen extends StatefulWidget {
  @override
  _UserInfromationState createState() => _UserInfromationState();
}

class _UserInfromationState extends State<UserInfromationScreen> {



  late TextEditingController _dateController;
  final TextEditingController fullnameController = new TextEditingController();
  final TextEditingController pdffileController = new TextEditingController();
  final TextEditingController phonenumberController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    // Set the initial value of the date controller to the current date
    _dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }
  // Function to show the date picker dialog


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }






  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic>? args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    String contract=" ";
    String price=" ";

    if (args != null) {
      contract = args['contract'];
      price=args['price'];
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: fullnameController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(Icons.person, color: Colors.black),
                  hintText: "fullname",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 30.0),


              TextFormField(
                controller: _dateController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Born Date',
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true, // So the user has to use the calendar to pick the date
              ),



              TextFormField(
                  controller: phonenumberController,
                cursorColor: Colors.white,
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone, color: Colors.black),
                  hintText: "phone number",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),

              TextFormField(
                //  controller: passwordController,
                cursorColor: Colors.white,
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.black),
                  hintText: "pdf file link",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                height: 40.0,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                margin: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('$contract'),
                          content: Text('$contract  has been Register with the with payment of $price'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pushNamed('/PaymentScreen',arguments: {
                                  'price': "$price",
                                });
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text("Submit",
                      style: TextStyle(color: Colors.black)),
                ),
              ),






            ],
          ),
        ),
      ),
    );
  }
}



































/*
    extends StatelessWidget {
InformationUser({super.key});
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
                    "User Information",
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
                          labelText: 'full name',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (_selectedDate != null)
                        Text(
                          'Selected Date: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                          style: TextStyle(fontSize: 16),
                        ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _pickDate(context),
                        child: Text('Select Date'),
                      ),

                      TextFormField(
                        controller: passwordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'born',
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


                                if(usernameController.text.isNotEmpty&&usernameController.text=='admin'&&passwordController.text.isNotEmpty&&passwordController.text=='admin'){

                                  Navigator.of(context).pushNamed('/Adminpage');
                                }else {




                                }
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



}
*/
