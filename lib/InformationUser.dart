import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InformationUser extends StatelessWidget {
  String contract = " ";
  String price = " ";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      contract = args['contract'];
      price = args['price'];
    }

    return MaterialApp(
      title: 'Date Selector Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInfromationScreen(
        price: price,
        contract: contract,
      ),
    );
  }
}

class UserInfromationScreen extends StatefulWidget {
  final String price;
  final String contract;

  UserInfromationScreen({required this.price, required this.contract});

  @override
  _UserInfromationState createState() =>
      _UserInfromationState(price: price, contract: contract);
}

class _UserInfromationState extends State<UserInfromationScreen> {
  final String price;
  final String contract;

  _UserInfromationState({required this.price, required this.contract});

  late TextEditingController _dateController;
  final TextEditingController fullnameController = new TextEditingController();
  final TextEditingController pdffileController = new TextEditingController();
  final TextEditingController phonenumberController =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Set the initial value of the date controller to the current date
    _dateController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill)),
        child: Center(
          child: Form(
            key: _formKey,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your fullname';
                      }
                    }),
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

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Born Date';
                    }
                  },
                  readOnly:
                      true, // So the user has to use the calendar to pick the date
                ),
                TextFormField(
                  controller: phonenumberController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone, color: Colors.black),
                    hintText: "phone number",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    if (value.length < 9) {
                      return 'please enter valid phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    //  controller: passwordController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock, color: Colors.black),
                      hintText: "pdf file link",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid link';
                      }
                    }),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  margin: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')),
                        );

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(widget.contract),
                              content: Text(
                                  '$contract  has been Register with the with payment of $price'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushNamed(
                                        '/PaymentScreen',
                                        arguments: {
                                          'price': "${widget.price}",
                                        });
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text("Submit",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
