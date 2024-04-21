import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'DatabaseHelper.dart';





class ContractData {
  final String name;
  final String email;
  final String contracttype;
  final String contractname;
  final String contact;

  ContractData({
    required this.name,
    required this.email,
    required this.contracttype,
    required this.contractname,
    required this.contact,
  });
}

class ContractSaved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListContract(),
    );
  }
}



class MyListContract extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListContract> {
  List<ContractData>? _items;



  @override
  void initState() {
    super.initState();
    _fetchItems();
  }


  Future<void> _fetchItems() async {
    List<ContractData>  contractData=await DatabaseHelper.instance.getDataFromDatabase();
    setState(() {
      _items = contractData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: ListView.builder(
        itemCount: _items!.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: _items![index]);
        },
      ),
    );
  }
}


class ItemWidget extends StatelessWidget {
  final  ContractData item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(item.name),
              Text('Name: ${item.name}'),
              Text('Contact: ${item.contact}'),
              Text('Email: ${item.email}'),

            ],
          ),
      ),
    );
  }
}