import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              SizedBox(
                height: 100,
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
                width: MediaQuery.of(context).size.width - 80,
                decoration:  BoxDecoration(
                  color: const Color(0xff1c2e4a),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name", style: TextStyle(
                              color: Color(0xffffad03),
                              fontSize: 18
                          ),),
                          Text("Email", style: TextStyle(
                              color: Color(0xffffad03),
                              fontSize: 18
                          ),),
                          Text("Phone Number", style: TextStyle(
                              color: Color(0xffffad03),
                              fontSize: 18
                          ),),
                        ],
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * (1/3),
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/marriage_contract.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Marrige Contracts", style: TextStyle(
                          color: Color(0xffffad03),
                          fontSize: 18
                      ),)
                    ],
                  ),
                ),
              ),

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/lawyer.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Divorces", style: TextStyle(
                          color: Color(0xffffad03),
                          fontSize: 18
                      ),)
                    ],
                  ),
                ),
              ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            image: AssetImage("assets/attorney.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Power of Attorney", style: TextStyle(
                          color: Color(0xffffad03),
                          fontSize: 18
                      ),)
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 200, // specify the desired width
                  height: 100, // specify the desired height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/PaymentScreen');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Text(
                      'Centered Widget',
                      style: TextStyle(fontSize: 20), // increase font size if needed
                    ),
                  ),
                ),
              )
,
            ],
          ),
        ),
      ),
    );
  }
}
