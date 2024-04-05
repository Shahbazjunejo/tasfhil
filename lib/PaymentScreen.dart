import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _cardController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width - 80,
                decoration:  BoxDecoration(
                  color: const Color(0xff1c2e4a),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Total Price", textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                          fontSize: 18
                      ),
          
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                       Text("0", style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18
                      ),)
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 850,
                decoration:  BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/img.png"),
                  ),
                ),
              ),
              Text(
                'Credit Card Number',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                controller: _cardController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Text(
                'Card Holder Name',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                controller: _expiryController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              Text(
                'Amount',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                controller: _cvcController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 32),
              const SizedBox(
                width: 20,
              ),
          
              Center(
                child: SizedBox(
                  width: 600, // specify the desired width
                  height: 80, // specify the desired height
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('PAYMENT'),
                            content: Text('PAYMENT HAS BEEN PAID'),
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
          
                    },   style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                  ),
                    child: Text('Pay Now'),
                  ),
                ),
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }

}