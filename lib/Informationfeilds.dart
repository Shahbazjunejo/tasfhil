import 'package:flutter/material.dart';



class informationfeilds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFormPage(),
    );
  }
}

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  bool showFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form with Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: showFields ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: AnimatedSize(
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: showFields ? 300 : 0,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Field 1'),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Field 2'),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Field 3'),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Field 4'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showFields = !showFields;
                });
              },
              child: Text(showFields ? 'Hide Fields' : 'Show Fields'),
            ),
          ],
        ),
      ),
    );
  }
}
