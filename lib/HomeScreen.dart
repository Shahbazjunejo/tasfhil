import 'package:flutter/material.dart';

import 'DatabaseHelper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? userData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    String name=  userData?[DatabaseHelper.columnName];
    String email=  userData?[DatabaseHelper.columnemail];
    String contact=  userData?[DatabaseHelper.columncontact];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width - 80,
                  child: TextField(
                    style: const TextStyle(
                      color: Color(0xff020202),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xfff1f1f1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          color:  Color(0xffb2b2b2),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          decorationThickness: 6),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width-30 ,
                  decoration:  BoxDecoration(
                    color: const Color(0xff1c2e4a),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                         Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: $name", style: TextStyle(
                                color: Color(0xffffad03),
                                fontSize: 18
                            ),),

                            Text("Email: $email", style: TextStyle(
                                color: Color(0xffffad03),
                                fontSize: 18
                            ),),

                            Text("Phone:  $contact", style: TextStyle(
                                color: Color(0xffffad03),
                                fontSize: 18
                            ),),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * (1/3),
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration:  BoxDecoration(
                    color: const Color(0xff1c2e4a),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/contract.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        ElevatedButton(
                            onPressed: () {
                              // Your onPressed function logic here
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Marrige Contracts'),
                                    content: Text('Marrige Contracts  has been Register with the $name and $email and contact $contact with payment of 1500'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          registerContract(name, email, contact,'M','Marrige Contracts' );
                                          Navigator.of(context).pushNamed('/PaymentScreen',arguments: {
                                            'price': "1500",
                                          });
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff1c2e4a)), // Set background color
                            ),
                            child:   const Text("Marrige Contracts", style: TextStyle(
                                color: Color(0xffffad03),
                                fontSize: 12
                            ),)
                        ),


                      ],
                    ),
                  ),
                ),
            
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration:  BoxDecoration(
                    color: const Color(0xff1c2e4a),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/divorce.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),

                        ElevatedButton(
                          onPressed: () {
                            // Your onPressed function logic here
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Divorce Contract'),
                                  content: Text('Divorce Contract  has been Register with the $name and $email and contact $contact with payment of 120'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pushNamed('/PaymentScreen',arguments: {
                                          'price': "120",
                                        });
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff1c2e4a)), // Set background color
                            ),
                          child: const Text("Divorces", style: TextStyle(
                              color: Color(0xffffad03),
                              fontSize: 12
                          ),)
                        ),


                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration:  BoxDecoration(
                    color: const Color(0xff1c2e4a),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/attorney.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Power of Attorney'),
                                    content: Text('Power of Attorney  has been Register with the $name and $email and contact $contact with payment of 120'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          registerContract(name, email, contact,'P','Power of Attorney' );
                                          Navigator.of(context).pushNamed('/PaymentScreen',arguments: {
                                            'price': "120",
                                          });
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff1c2e4a)), // Set background color
                            ),
                            child:  const Text("Power of Attorney", style: TextStyle(
                                color: Color(0xffffad03),
                                fontSize: 12
                            ),)
                        ),



                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
/*                Center(
                  child: SizedBox(
                    width: 400, // specify the desired width
                    height: 80, // specify the desired height
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                      ),
                      child: Text(
                        'Pay Now',
                        style: TextStyle(fontSize: 20), // increase font size if needed
                      ),
                    ),
                  ),
                )
            ,*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  void registerContract(String username, String email,String contact,String contracttype,String contractname ) async {
    int id = await DatabaseHelper.instance.insertcontract({
      DatabaseHelper.columnName: username,
      DatabaseHelper.columnemail: email,
      DatabaseHelper.columncontracttype:contracttype,
      DatabaseHelper.columncontractname :contractname,
      DatabaseHelper.columncontact:contact ,
    });
    if (id != null) {
      print('User registered successfully');
      
    } else {
      print('Failed to register user');
    }
  }


}
